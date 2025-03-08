//
//  Animation.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

extension UIButton {
    func rotates() {
        
       

        UIView.animate(withDuration: 0.6,
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.6) {
                    self.transform = CGAffineTransform.identity
                }
            })
      }
//
    
    func rotates(completion:@escaping () -> () = {}) {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
           })
}
    
    func rotate(completion:@escaping () -> () = {}) {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 1)
        rotation.duration = 0.5
        rotation.isCumulative = true
//        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
}
    
    func press(completion:@escaping () -> () = {}) {
        UIView.animate(withDuration: 0.05, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9) }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.transform = CGAffineTransform.identity
                    completion()
                })
        })
}
    func showAnimation(completion:@escaping () -> () = {}) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform.identity
            }) { (_) in
             
            }
        }
    }
  
    func showAnimationView(completion:@escaping () -> () = {}) {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = CGAffineTransform.identity
            }) { (_) in
                
            }
        }
    }
}

extension UIView {
  
    
        func buttonAnimation(_ completion: @escaping () -> () = {} ) {
            self.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            UIView.animate(withDuration             : 0.3,
                           delay                    : 0,
                           usingSpringWithDamping   : CGFloat(0.2),
                           initialSpringVelocity    : CGFloat(2.0),
                           options                  : UIView.AnimationOptions.allowUserInteraction,
                           animations               : {
                                self.transform = CGAffineTransform.identity
                            },
                           completion               : { _ in
                                completion()
                            })
        }
        
      func pulsate(_ completion: @escaping () -> () = {}) {
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.3
            pulse.fromValue = 0.90
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 1
            //        pulse.initialVelocity = 0.5
            //        pulse.damping = 1.0
            layer.add(pulse, forKey: nil)
          completion()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 42.0) {
//                    // do stuff 42 seconds later
//                completion()
//                }
        }
        func flash(_ completion: @escaping () -> () = {} ) {
            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.2
            flash.fromValue = 1
            flash.toValue = 0.1
            flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut )
            flash.autoreverses = true
            flash.repeatCount = 1
            layer.add(flash, forKey: nil)
            completion()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
//                completion()
//            }
        }
    
    /**
     Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.

     - parameter duration: animation duration
     */
    func zoomIn(duration: TimeInterval = 0.2,completion: @escaping () -> () = {}) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = .identity
            },completion               : { _ in
                completion()
            })
    }

    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.

     - parameter duration: animation duration
     */
    
    
    // zoom out disppear
    func zoomOut(duration : TimeInterval = 0.2,completion: @escaping () -> () = {}) {
        self.transform = .identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5) //scaleX, Y to see the different
            }, completion               : { _ in
                completion()
            })
    }

    /**
     Zoom in any view with specified offset magnification.

     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2, completion: @escaping () -> () = {}) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
            }, completion: { (completed: Bool) -> Void in
                UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                    self.transform = .identity
                    }, completion               : { _ in
                        completion()
                    })
        })
    }

    /**
     Zoom out any view with specified offset magnification.

     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2,completion: @escaping () -> () = {}) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
            }, completion: { (completed: Bool) -> Void in
                UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                    self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                    },  completion               : { _ in
                        completion()
                    })
        })
    }

    func shake(_ completion: @escaping () -> () = {}) {

        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 2
        shake.autoreverses = true

        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)

        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)

        shake.fromValue = fromValue
        shake.toValue = toValue

        layer.add(shake, forKey: "position")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
            completion()
        }
    }
    
    func animateButtonDown(completion: @escaping () -> () = {}) {

        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },   completion               : { _ in
            completion()
        })
    }

    func animateButtonUp(completion: @escaping () -> () = {}) {

        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        },  completion               : { _ in
            completion()
        })
    }
}
