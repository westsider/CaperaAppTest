/// Copyright (c) 2020 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI
import RealityKit
import ARKit

var arView: ARView!
var lazer: Experience.Lazer!

struct ContentView : View {
    
    @State var propId: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(propId: $propId).edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                Button(action: {
                    self.TakeSnapshot()
                }) {
                    Image("ShutterButton")
                        .clipShape(Circle())
                }
                Spacer()
            }
        }
    }
    
    func TakeSnapshot() {
        arView.snapshot(saveToHDR: false) { (image) in
            let compressedImage = UIImage(data: (image?.pngData())!)
            UIImageWriteToSavedPhotosAlbum(compressedImage!, nil, nil, nil)
        }
    }
}

class TextHelp {
    static func makeText(textAnchor: Experience.Lazer, message: String) -> Experience.Lazer? {
        print(message)
        let textEntity: Entity =  (textAnchor.infoSign?.children[0].children[0])!
        var textModelComponent: ModelComponent = (textEntity.components[ModelComponent])!
        guard let myFont = UIFont(name: "Helvetica-Light", size: 0.05) else { return nil }

        textModelComponent.mesh = .generateText(message,
                                 extrusionDepth: 0.0,
                                           font: myFont,
                                 containerFrame: CGRect.zero,
                                      alignment: .center,
                                  lineBreakMode: .byCharWrapping)
        textAnchor.infoSign?.children[0].children[0].components.set(textModelComponent)
        return textAnchor
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var propId: Int
    
    func makeUIView(context: Context) -> ARView {
        arView = ARView(frame: .zero)
        arView.session.delegate = context.coordinator
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
 
            arView.scene.anchors.removeAll()
            
            let arConfiguration = ARFaceTrackingConfiguration()
            uiView.session.run(arConfiguration, options:[.resetTracking, .removeExistingAnchors])
       
            let arAnchor = try! Experience.loadLazer()
            uiView.scene.anchors.append(arAnchor)
            lazer = arAnchor
            _ = TextHelp.makeText(textAnchor: lazer, message: "LOADED")
        }
    
    func makeCoordinator() -> ARDelegateHandler {
        ARDelegateHandler(self)
    }
    

    
    class ARDelegateHandler: NSObject, ARSessionDelegate {
        
        var arViewContainer: ARViewContainer
        
        init(_ control: ARViewContainer) {
            arViewContainer = control
            super.init()
        }
        
        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            
            guard lazer != nil else { return }

            let arFrame = session.currentFrame!
            guard let faceAnchor = arFrame.anchors[0] as? ARFaceAnchor else { return }
            let projectionMatrix = arFrame.camera.projectionMatrix(for: .portrait, viewportSize: arView.bounds.size, zNear: 0.001, zFar: 1000)
            let viewMatrix = arFrame.camera.viewMatrix(for: .portrait)
            
            let projectionViewMatrix = simd_mul(projectionMatrix, viewMatrix)
            let modelMatrix = faceAnchor.transform
            let mvpMatrix = simd_mul(projectionViewMatrix, modelMatrix)
            
            // This allows me to just get a .x .y .z rotation from the matrix, without having to do crazy calculations
            let newFaceMatrix = SCNMatrix4.init(mvpMatrix)
            let faceNode = SCNNode()
            faceNode.transform = newFaceMatrix
            let rotation = vector_float3(faceNode.worldOrientation.x, faceNode.worldOrientation.y, faceNode.worldOrientation.z)
            
            let yaw = -rotation.y*3
            let pitch = -rotation.x*3
            let roll = rotation.z*1.5
    
            let yawS = String(format: "%.2f", -rotation.y*3 )
            let pitchS = String(format: "%.2f", -rotation.x*3  )
            let rollS =  String(format: "%.2f", rotation.z*1.5 )
            
            var pan = false
            var tilt = false
            var rolly = false

            if pitch > -0.02 && pitch < 0.02 {
                tilt = true
            } else { tilt = false }

            if yaw > -0.12 && yaw < -0.0 {
                pan = true
            } else { pan = false }
            
            if roll > -0.06 && roll < 0.06 { 
                rolly = true
            } else { rolly = false }
            
            if pan && tilt && rolly {
                print("LOCKED")
                _ = TextHelp.makeText(textAnchor: lazer, message: "LOCKED")
            } else {
                let message = String("\(pan ? "" : "yaw \(yawS)") \(tilt ? "" : "\npitch \(pitchS)") \(rolly ? "" : "\nroll \(rollS)")")
                print(message)
                _ = TextHelp.makeText(textAnchor: lazer, message: message)
            }
            
            //_ = TextHelp.makeText(textAnchor: lazer, message: pitchS)
            
            func Deg2Rad(_ value: Float) -> Float {
              return value * .pi / 180
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

extension SCNGeometry {
    class func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]

        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)

        return SCNGeometry(sources: [source], elements: [element])
    }
}


class HHelper {
    static func distanceFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> Float {
        let x0 = vector1.x
        let x1 = vector2.x
        let y0 = vector1.y
        let y1 = vector2.y
        let z0 = vector1.z
        let z1 = vector2.z

        return sqrtf(powf(x1-x0, 2) + powf(y1-y0, 2) + powf(z1-z0, 2))
    }
}
