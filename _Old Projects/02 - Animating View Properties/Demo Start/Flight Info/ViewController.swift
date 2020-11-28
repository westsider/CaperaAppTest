/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import QuartzCore


//MARK: ViewController
class ViewController: UIViewController {
    
    @IBOutlet var bgImageView: UIImageView!
    
    @IBOutlet var summaryIcon: UIImageView!
    @IBOutlet var summary: UILabel!
    
    @IBOutlet var flightNr: UILabel!
    @IBOutlet var gateNr: UILabel!
    @IBOutlet var departingFrom: UILabel!
    @IBOutlet var arrivingTo: UILabel!
    @IBOutlet var planeImage: UIImageView!
    
    @IBOutlet var flightStatus: UILabel!
    @IBOutlet var statusBanner: UIImageView!
    
    var snowView: SnowView!
    
    //MARK:- animations
    func fade(
        toImage: UIImage,
        showEffects: Bool
        ) {
        let tempView = UIImageView(frame: bgImageView.frame)
        tempView.image = toImage
        tempView.alpha = 0.0
        tempView.center.y += 20
        tempView.bounds.size.width = bgImageView.bounds.width * 1.3
        bgImageView.superview?.insertSubview(tempView, aboveSubview: bgImageView)
        
        UIImageView.animate(
            withDuration: 0.5,
            animations: {
                tempView.alpha = 1.0
                tempView.center.y -= 20
                tempView.bounds.size = self.bgImageView.bounds.size
        }, completion: { _ in
            self.bgImageView.image = toImage
            tempView.removeFromSuperview()
            }
        )
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            options: .curveEaseOut,
            animations: {
                self.snowView.alpha = showEffects ? 1.0 : 0.0
        },
            completion: nil)
    }
    
    func moveLabel(
            label : UILabel,
            text: String,
            offset: CGPoint
        ) {
        
            let tempLabel = duplicateLabel(label: label)
            tempLabel.text = text
            tempLabel.transform = CGAffineTransform(translationX: offset.x, y: offset.y)
            tempLabel.alpha = 0.0
            view.addSubview(tempLabel)
        
            UIView.animate(
                withDuration: 0.5,
                delay: 0.0,
                options: .curveEaseIn,
                animations: {
                    label.transform = CGAffineTransform(translationX: offset.x, y: offset.y)
                    label.alpha = 0.0
            },
                completion: nil)
        
            UIView.animate(
                withDuration: 0.25,
                delay: 0.2,
                options: .curveEaseIn,
                animations: {
                    label.transform = .identity
                    label.alpha = 1.0
            },
                completion: { _ in
                    label.text = text
                    label.alpha = 1.0
                    label.transform = .identity
                    tempLabel.removeFromSuperview()
            })
    }
    
    func cubeTransition() {
        //TODO: Create a faux rotating cube animation
    }
    
    
    func planeDepart() {
        //TODO: Animate the plane taking off and landing
    }
    
    func changeSummary(to summaryText: String) {
        //TODO: Animate the summary text
        
        delay(seconds: 0.5) {
            self.summary.text = summaryText
        }
    }
    
    
    //MARK:- custom methods
    
    func changeFlight(to data: FlightData, animated: Bool = false) {
        // populate the UI with the next flight's data
        departingFrom.text = data.departingFrom
        arrivingTo.text = data.arrivingTo
        flightNr.text = data.flightNr
        gateNr.text = data.gateNr
        flightStatus.text = data.flightStatus
        summary.text = data.summary
        
        if animated {
            fade(
                toImage: UIImage(named: data.weatherImageName)!,
                showEffects: data.showWeatherEffects
            )
            let offsetDeaprting = CGPoint(
                x: data.showWeatherEffects ? -80.0 : 80,
                y: 0.0)
            let offsetArriving = CGPoint(
                x:  0.0,
                y: data.showWeatherEffects ? 50.0 : -50.0)
            
            moveLabel(
                label: departingFrom,
                text: data.departingFrom,
                offset: offsetDeaprting)
            
            moveLabel(
                label: arrivingTo,
                text: data.arrivingTo,
                offset: offsetArriving)
        } else {
            bgImageView.image = UIImage(named: data.weatherImageName)
            snowView.isHidden = !data.showWeatherEffects
            departingFrom.text = data.departingFrom
            arrivingTo.text = data.arrivingTo
        }
        
        // schedule next flight
        delay(seconds: 3.0) {
            self.changeFlight(to: data.isTakingOff ? parisToRome : londonToParis, animated: true)
        }
    }
    
    //MARK:- view controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adjust UI
        summary.addSubview(summaryIcon)
        summaryIcon.center.y = summary.frame.size.height/2
        
        //add the snow effect layer
        snowView = SnowView(frame: CGRect(x: -150, y:-100, width: 300, height: 50))
        let snowClipView = UIView(frame: view.frame.offsetBy(dx: 0, dy: 50))
        snowClipView.clipsToBounds = true
        snowClipView.addSubview(snowView)
        view.addSubview(snowClipView)
        
        //start rotating the flights
        changeFlight(to: londonToParis, animated: false)
    }
    
    
    //MARK:- utility methods
    func delay(seconds: Double, completion: @escaping ()-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    }
    
    func duplicateLabel(label: UILabel) -> UILabel {
        let newLabel = UILabel(frame: label.frame)
        newLabel.font = label.font
        newLabel.textAlignment = label.textAlignment
        newLabel.textColor = label.textColor
        newLabel.backgroundColor = label.backgroundColor
        return newLabel
    }
}
