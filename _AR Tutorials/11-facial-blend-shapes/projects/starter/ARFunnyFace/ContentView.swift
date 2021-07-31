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
var robot: Experience.Robot!
var lazer: Experience.Lazer!

struct ContentView : View {
    
    @State var propId: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer(propId: $propId).edgesIgnoringSafeArea(.all)
            HStack {
                
                Spacer()
                
                Button(action: {
                    self.propId = self.propId <= 0 ? 0 : self.propId - 1
                }) {
                    Image("PreviousButton").clipShape(Circle())
                }
                
                Spacer()
                
                Button(action: {
                    self.TakeSnapshot()
                }) {
                    Image("ShutterButton")
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Button(action: {
                    self.propId = self.propId >= 4 ? 4 : self.propId + 1
                }) {
                    Image("NextButton").clipShape(Circle())
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

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var propId: Int
    
    func makeUIView(context: Context) -> ARView {
        arView = ARView(frame: .zero)
        arView.session.delegate = context.coordinator
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        robot = nil
        arView.scene.anchors.removeAll()
        
        let arConfiguration = ARFaceTrackingConfiguration()
        uiView.session.run(arConfiguration, options:[.resetTracking, .removeExistingAnchors])
        
        switch(propId) {
        case 0: // Eyes
            let arAnchor = try! Experience.loadLazer()
            uiView.scene.anchors.append(arAnchor)
            lazer = arAnchor
            //print(lazer.circleL?.anchor?.components)
            break
        case 1: // Glasses
            let arAnchor = try! Experience.loadGlasses()
            uiView.scene.anchors.append(arAnchor)
            break
        case 2: // Mustache
            let arAnchor = try! Experience.loadMustache()
            uiView.scene.anchors.append(arAnchor)
            break
        case 3: // Robot
            let arAnchor = try! Experience.loadRobot()
            uiView.scene.anchors.append(arAnchor)
            robot = arAnchor
            break
        case 4:
            let arAnchor = try! Experience.loadEyes()
            uiView.scene.anchors.append(arAnchor)
            break
        default:
            break
        }
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
            
            
            let yawS = String(format: "%.2f", -rotation.y*3 * 100.0)
            let pitchS = String(format: "%.2f", -rotation.x*3  * 100.0)
            let rollS =  String(format: "%.2f", rotation.z*1.5 * 100.0)
            
            if pitch > -0.03 && pitch < 0.00 {
                print("\n--------> Pitch Locked <----------")
            }
            
            if yaw > -0.13 && yaw < 0.0 {
                print("--------> Pan Locked <----------\n")
            } else {
                print("yaw: \(yawS), pitch: \(pitchS) roll: \(rollS)")
            }

            //MARK: - TODO - make the color change to green when OK
            //MARK: - TODO - add roll
            
            
            //guard let comp = lazer.circleL?.anchor?.components else { return }
            
            // print("we have a lazer  comp: \(comp)\n")
     
            //print("\(lazer.circleL?.anchor) ::  \(lazer.laserL?.anchor )")
 
//            guard robot != nil else { return }

//            var faceAnchor: ARFaceAnchor?
//            for anchor in anchors {
//                if let a = anchor as? ARFaceAnchor {
//                    faceAnchor = a
//                }
//            }

//          let blendShapes = faceAnchor?.blendShapes
//            let eyeBlinkLeft = blendShapes?[.eyeBlinkLeft]?.floatValue
//            let eyeBlinkRight = blendShapes?[.eyeBlinkRight]?.floatValue
//            let browInnerUp = blendShapes?[.browInnerUp]?.floatValue
//            let browLeft = blendShapes?[.browDownLeft]?.floatValue
//            let browRight = blendShapes?[.browDownRight]?.floatValue
//            let jawOpen = blendShapes?[.jawOpen]?.floatValue

//            let blendShapes = lazer.circleL?.anchor?.convert(position: lazer.position, from: lazer)
//
//            let blendShapes2 = lazer.position(relativeTo: lazer.circleL)
//
//            let blendShapes3 = lazer.circleL?.position(relativeTo: lazer.laserL)
            
            
            
            
            
            
//            var startPoint: SCNVector3!
//            var endPoint: SCNVector3!
//
//            let cirL = lazer.circleL?.anchor?.transform
//            print(cirL)
//            guard let Circle_Lx = cirL?.x else { return }
//            guard let Circle_Ly = cirL?.y else { return }
//            guard let Circle_Lz = cirL?.z else { return }
//
//
//
//            let lazL = lazer.laserL?.transform
//            guard let Laser_Lx = lazL?.x else { return }
//            guard let Laser_Ly = lazL?.y else { return }
//            guard let Laser_Lz = lazL?.z else { return }
//
//
//            endPoint = SCNVector3(Circle_Lx, Circle_Ly, Circle_Lz)
//            startPoint = SCNVector3(Laser_Lx, Laser_Ly, Laser_Lz)
//
//
//
//            var dist = HHelper.distanceFrom(vector: startPoint, toVector: endPoint)
//            let distS = String(format: "%.6f", dist * 1000)
//            print(distS)
            
            
//            let Circle_Lxs = String(format: "%.2f", Circle_Lx * 100.0)
//            let Circle_Lys = String(format: "%.2f", Circle_Ly * 100.0)
//           // print("Circle_L: x,y \t\t\t\(Circle_Lxs), \t\(Circle_Lys)")
//
//            guard let Laser_Rx = cirL?.columns.1.x else { return }
//            guard let Laser_Ry = cirL?.columns.1.y else { return }
//            let Laser_Rxs = String(format: "%.2f", Laser_Rx * 100.0)
//            let Laser_Rys = String(format: "%.2f", Laser_Ry * 100.0)
//            //print("Laser_R: x,y \t\t\t\(Laser_Rxs), \t\(Laser_Rys)")
//
//            guard let Circle_Rx = cirL?.columns.2.x else { return }
//            guard let Circle_Ry = cirL?.columns.2.y else { return }
//            let Circle_Rxs = String(format: "%.2f", Circle_Rx * 100.0)
//            let Circle_Rys = String(format: "%.2f", Circle_Ry * 100.0)
//            //print("Circle_Rx: x,y \t\t\t\(Circle_Rxs), \t\(Circle_Rys)")
//
//            guard let Laser_Lx = cirL?.columns.3.x else { return }
//            guard let Laser_Ly = cirL?.columns.3.y else { return }
//            let Laser_Lxs = String(format: "%.2f", Laser_Lx * 100.0)
//            let Laser_Lys = String(format: "%.2f", Laser_Ly * 100.0)
            //print("Laser_L: x,y \t\t\t\(Laser_Lxs), \t\(Laser_Lys)")
            
            
            func Deg2Rad(_ value: Float) -> Float {
              return value * .pi / 180
            }
            
    
       
            
            
            
//
//            robot.eyeLidL?.orientation = simd_mul(
//
//              simd_quatf(
//                angle: Deg2Rad(-120 + (90 * eyeBlinkLeft!)),
//                axis: [1, 0, 0]),
//
//              simd_quatf(
//                angle: Deg2Rad((90 * browLeft!) - (30 * browInnerUp!)),
//                axis: [0, 0, 1]))
//
//            robot.eyeLidR?.orientation = simd_mul(
//              simd_quatf(
//                angle: Deg2Rad(-120 + (90 * eyeBlinkRight!)),
//                axis: [1, 0, 0]),
//              simd_quatf(
//                angle: Deg2Rad((-90 * browRight!) - (-30 * browInnerUp!)),
//                axis: [0, 0, 1]))
//
//            robot.jaw?.orientation = simd_quatf(
//              angle: Deg2Rad(-100 + (60 * jawOpen!)),
//              axis: [1, 0, 0])
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

//extension SCNVector3 {
//    static func distanceFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> Float {
//        let x0 = vector1.x
//        let x1 = vector2.x
//        let y0 = vector1.y
//        let y1 = vector2.y
//        let z0 = vector1.z
//        let z1 = vector2.z
//
//        return sqrtf(powf(x1-x0, 2) + powf(y1-y0, 2) + powf(z1-z0, 2))
//    }
//}

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
