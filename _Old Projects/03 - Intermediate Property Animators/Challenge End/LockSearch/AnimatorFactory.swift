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

class AnimatorFactory {
  
  static func grow(
    view: UIVisualEffectView,
    blurView: UIVisualEffectView
    ) -> UIViewPropertyAnimator {
    view.contentView.alpha = 0
    view.transform = .identity
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn)
    
    animator.addAnimations {
      UIView.animateKeyframes(withDuration: 0.5, delay: 0.0, animations: {
        
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
          blurView.effect = UIBlurEffect(style: .dark)
          view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
          view.transform = view.transform.rotated(by: -.pi/8)
        }
      })
    }
    
    animator.addCompletion {_ in
      complete(view: view).startAnimation()
    }
    return animator
  }

  static func complete(view: UIVisualEffectView) -> UIViewPropertyAnimator {
    return UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.7) {
      view.contentView.alpha = 1
      view.transform = .identity
      view.frame = CGRect(
        x: view.frame.minX - view.frame.minX/2.5,
        y: view.frame.maxY - 140,
        width: view.frame.width + 120,
        height: 60
      )
    }
  }
  
  static func reset(
    frame: CGRect,
    view: UIVisualEffectView,
    blurView: UIVisualEffectView
    ) -> UIViewPropertyAnimator {
    
    return UIViewPropertyAnimator(
      duration: 0.5,
      dampingRatio: 0.7
    ) {
      view.transform = .identity
      view.frame = frame
      view.contentView.alpha = 0
      
      blurView.effect = nil
    }
  }
  
  @discardableResult
  static func animateConstraint(
    view: UIView,
    constraint: NSLayoutConstraint,
    by: CGFloat
    ) -> UIViewPropertyAnimator {
    let spring = UISpringTimingParameters(dampingRatio: 0.55)
    let animator = UIViewPropertyAnimator(
      duration: 1.0,
      timingParameters: spring
    )
    
    animator.addAnimations {
      constraint.constant += by
      view.layoutIfNeeded()
    }
    
    return animator
  }
  
  static func scaleUp(view: UIView) -> UIViewPropertyAnimator {
    let scale = UIViewPropertyAnimator(
      duration: 0.5,
      curve: .easeIn
    )
    scale.addAnimations {
      view.alpha = 1
    }
    scale.addAnimations({
      view.transform = CGAffineTransform.identity
      }, delayFactor: 0.25
    )
    scale.addCompletion{_ in
      print("Ready!")
    }
    
    return scale
  }
}








































