//
//  UIViewController.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    var hasSafeArea: Bool {
        
        var topPadding : CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        } else {
            // Fallback on earlier versions
        }
        if topPadding > 24 {
            return true
        }
        else {
            return false
        }
    }
    
    func closeAppWithoutLookingLikeCrash() {
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            exit(EXIT_SUCCESS)
        })
    }
    
    func ableToSwipeNavigationBack() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func disableToSwipeNavigationBack() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func clearConstraintLog() {
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    
    func presentVC(viewController: UIViewController, animated: Bool = true, completion: @escaping Completion = { }) {
        self.present(viewController, animated: animated) {
            completion()
        }
    }
    
    func presentVC(sbName: String, identifier: String, animated: Bool = true, completion: @escaping Completion = { }) {
        let vc = VC(sbName: sbName, identifier: identifier)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: animated) {
            completion()
        }
    }
    
    func presetVC(vc: UIViewController, modalPresentStyle: UIModalPresentationStyle = .fullScreen) {
        vc.modalPresentationStyle = modalPresentStyle
        self.present(vc, animated: true, completion: nil)
    }
    
    func pushVC(viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func pushVC(sbName: String, identifier: String, animated: Bool = true) {
        self.navigationController?.pushViewController(VC(sbName: sbName, identifier: identifier), animated: animated)
    }
    
    func popOrDismissVC(animated: Bool = true, completion: @escaping Completion = { }) {
        if let nav = self.navigationController {
            
            //when there is no more children to popViewController use dismiss
            if nav.viewControllers.count > 1 {
                nav.popViewController(animated: animated)
                completion()
            }else {
                self.dismiss(animated: animated) {
                    completion()
                }
            }
        }
        else {
            self.dismiss(animated: animated) {
                completion()
            }
        }
    }
    
    func VC(sbName: String, identifier: String) -> UIViewController {
        return UIStoryboard(name: sbName, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    func navController(sbName: String, identifier: String) -> UINavigationController {
        return UIStoryboard(name: sbName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! UINavigationController
    }
    
    func removePreviousVC() {
        // Remove last stack of navigationController
        if let navigationController = self.navigationController {
            var navigationArray = navigationController.viewControllers  // To get all UIViewController stack as Array
            navigationArray.remove(at: navigationArray.count - 2)       // To remove previous UIViewController
            self.navigationController?.viewControllers = navigationArray
        }
    }
    
    func removePreviousVC(withNumberOfViewContollerNeedToRollback numberOfVC: Int) {
        // Remove last stack of navigationController
        if let navigationController = self.navigationController {
            var navigationArray = navigationController.viewControllers  // To get all UIViewController stack as Array
            navigationArray.remove(at: navigationArray.count - numberOfVC) // To remove previous UIViewController
            self.navigationController?.viewControllers = navigationArray
        }
    }
    
    // Important
    func setRootViewController(sbName: String, identifier: String, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(VC(sbName: sbName, identifier: identifier), options: animateOption)
    }
    
    // Important
    func setRootViewController(viewController: UIViewController, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(viewController, options: animateOption)
    }
    
    // Important
    func setRootNavViewController(sbName: String, identifier: String, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(navController(sbName: sbName, identifier: identifier), options: animateOption)
    }
    
    // Important
    func setRootNavViewController(navigation: UINavigationController, direction: UIWindow.TransitionOptions.Direction = .fade, duration: TimeInterval = 0.3) {
        let window              = UIApplication.shared.keyWindow
        var animateOption       = UIWindow.TransitionOptions()
        animateOption.direction = direction
        animateOption.duration  = duration
        window?.setRootViewController(navigation, options: animateOption)
    }
    
    func PopupVC(storyboard: String, identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        return vc
    }
    func popupVcFullScreen(storyboard: String, identifier: String) -> UIViewController {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        return vc
    }
    
    func showToast(message: String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    func showToastSaveImage(message: String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.blue
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        self.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
//    func setTheme(font: UIFont, barTint: UIColor = .white, tint: UIColor = .black) {
//        navigationController?.navigationBar.barTintColor        = barTint
//        navigationController?.navigationBar.tintColor           = tint
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: tint, .font: font]
//        navigationController?.navigationBar.isTranslucent       = false
//        navigationController?.navigationBar.removeShadow()
//    }
    
    @objc func leftBarButtonAction() {
        self.popOrDismissVC()
    }
    
    func setupMinimalNavigationBar() {
        // Remove the default back button title
        navigationItem.backButtonDisplayMode = .minimal
        
        // Set the back button image
        let backImage = UIImage(systemName: "chevron.left")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        // Make navigation bar background transparent
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        // Set the tint color for the back button
        navigationController?.navigationBar.tintColor = .black
    }

    /// Configure the navigation bar with custom settings.
        /// - Parameters:
        ///   - isHidden: Whether the navigation bar should be hidden.
        ///   - animated: Whether the navigation bar changes should be animated.
        ///   - title: The title of the navigation bar.
        ///   - titleColor: The color of the title text.
        ///   - barTintColor: The background color of the navigation bar.
        ///   - leftBarButtonImage: The image for the left bar button.
        ///   - leftSelector: The action for the left bar button.
        ///   - rightBarButtonImage: The image for the right bar button.
        ///   - rightBarButtonTitle: The title for the right bar button.
        ///   - rightBarButtonColor: The color of the right bar button title.
        ///   - rightSelector: The action for the right bar button.
        ///   - isEnable: Whether the right bar button is enabled.
        func setupNavigationBar(
            isHidden: Bool = false,
            animated: Bool = true,
            title: String? = nil,
            titleColor: UIColor = .black,
            barTintColor: UIColor = .white,
            leftBarButtonImage: UIImage? = nil,
            leftSelector: Selector? = nil,
            rightBarButtonImage: UIImage? = nil,
            rightBarButtonTitle: String? = nil,
            rightBarButtonColor: UIColor = .systemBlue,
            rightSelector: Selector? = nil,
            isEnable: Bool = true
        ) {
            // Navigation Bar Visibility
            navigationController?.setNavigationBarHidden(isHidden, animated: animated)
            
            // Navigation Bar Background Color
            navigationController?.navigationBar.barTintColor = barTintColor
            navigationController?.navigationBar.isTranslucent = true
            
            // Title and Title Color
            navigationItem.title = title
            navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: titleColor,
                .font: UIFont.systemFont(ofSize: 18, weight: .bold)
            ]
            
            // Left Bar Button Item
            if let leftImage = leftBarButtonImage, let action = leftSelector {
                let leftButton = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: action)
                dismiss(animated: true, completion: nil)
                navigationItem.leftBarButtonItem = leftButton
            }
            
            // Right Bar Button Item
            var rightButton: UIBarButtonItem?
            
            if let rightImage = rightBarButtonImage, let action = rightSelector {
                rightButton = UIBarButtonItem(image: rightImage, style: .plain, target: self, action: action)
            } else if let rightTitle = rightBarButtonTitle, let action = rightSelector {
                rightButton = UIBarButtonItem(title: rightTitle, style: .plain, target: self, action: action)
                rightButton?.tintColor = rightBarButtonColor
            }
            
            if let button = rightButton {
                button.isEnabled = isEnable
                navigationItem.rightBarButtonItem = button
            }
        }
    /* Common default navigation bar style
     * 1: isHidden -> Navigation bar hidden
     * 2: animated -> Navigation bar animted
     * 3: title -> Navigation bar title
     * 3+:titleColor -> Navigation bar title color
     * 4: barTintColor -> Navigation bar color
     * 5: leftBarButtonImage -> Navigation bar left barbutton image
     * 9: leftSelector -> Navigation bar left barbutton selector
     * 10: rightBarButtonImage -> Navigation bar right barbutton image
     * 11: rightBarButtonTitle -> Navigation bar right barbutton title
     * 12: rightBarButtonColor -> Navigation bar right barbutton title color
     * 13: selector -> Navigation bar right barbutton selector
     * 14: isEnable -> Navigation bar right barbutton enable/disable
     */
    func setNavigationBarStyle(isHidden: Bool,
                               animated: Bool,
                               title: String?,
                               leftBarButtonTitle leftBarTitle: String? = nil,
                               titleColor: UIColor = .colorValue(),
                               barTintColor: UIColor = .white,
                               leftBarButtonImage leftImage: UIImage? = UIImage(named: ""),
                               leftSelector: Selector? = #selector(leftBarButtonAction),
                               leftBarButtonColor LeftbuttonColors: [UIColor]? = nil,
                               rightBarButtonImage images: [UIImage?] = [],
                               rightBarButtonTitle buttonTitles: [String]? = nil,
                               rightBarButtonColor buttonColors: [UIColor]? = nil,
                               selectors: [Selector]? = nil,
                               isEnable: Bool = true,
                               numShares : String? = nil) {
            if #available(iOS 13.0, *) {
                
                self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
                
                self.navigationController?.navigationBar.standardAppearance.shadowColor = .clear
                self.navigationController?.navigationBar.scrollEdgeAppearance?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font : UIFont(name: "Gilroy-SemiBold", size: 20)!]
                self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font : UIFont(name: "Gilroy-SemiBold", size: 20)!]
                
                self.navigationController?.navigationBar.standardAppearance.backgroundColor = barTintColor
                
                // Set background color of ScrollEdgebackground
                self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor = barTintColor
                self.navigationController?.navigationBar.standardAppearance.shadowImage = UIImage()
    //            self.navigationController?.navigationBar.setBackgroundImage(UIImage().imageWithColor(color: .white), for: .default)
            } else {
                // Fallback on earlier versions
            }
//        }
      
        
        // Navigation bar title
        self.navigationItem.title = title
        
        // Navigation bar style
        self.navigationController?.setNavigationBarHidden(isHidden, animated: animated)
        
        // Default navigation bar is White
        self.navigationController?.navigationBar.barTintColor = barTintColor

        // Default navigation bar title color is "747474" and Font AppleSDGothicNeo-Medium
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font : UIFont.init(name: "Gilroy-SemiBold", size: 20)!]
        
        // Default navigation back button is empty
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        
        // Default navigation back button color is "747474"
        self.navigationController?.navigationBar.tintColor = UIColor(hexString: "747474")
        
        // Set rightBar button properties
        let right           : CGFloat               = 0 //-12 // Old = 6
        var rightBarButton  : [UIBarButtonItem]     = []
        
        for (i,_) in images.enumerated() {
            let rightbutton = UIButton(type: .custom)
            rightbutton.frame = CGRect(x: 0, y: 0, width: 30, height: 24)
            rightbutton.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 18)!
            rightbutton.contentHorizontalAlignment = .center
            rightbutton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: right)
//            right = right - 20
            
            rightbutton.setImage(images[i], for: .normal)
            
            if let buttonTitles = buttonTitles {
                rightbutton.setTitle(buttonTitles[i], for: .normal)
            }
            
            if let buttonColors = buttonColors {
                rightbutton.setTitleColor(buttonColors[i], for: .normal)
            }
            
            rightbutton.isEnabled = isEnable
            
            if let selectors = selectors {
                rightbutton.addTarget(self, action: selectors[i], for: .touchUpInside)
            }
                        
            rightBarButton.append(UIBarButtonItem(customView: rightbutton))
            
            /**
             - TODO : add count view
             - When RCPT_SHR_CNT != 0
            */
            if numShares != "0" {
                if rightBarButton.count == 2 {
                    let countView = UIView(frame: CGRect(x:20, y: 14, width: 15, height: 15))
                    let numLabel = UILabel()
                    numLabel.textAlignment = .center
                    numLabel.textColor = .white
                    numLabel.center = countView.center
                    numLabel.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 9)!
                    numLabel.text = numShares
                  
                    
                    countView.backgroundColor = UIColor(red: 54, green: 127, blue: 250)
                    countView.addSubview(numLabel)
                    
                    numLabel.translatesAutoresizingMaskIntoConstraints = false
                    numLabel.widthAnchor.constraint(equalTo: countView.widthAnchor).isActive = true
                    numLabel.centerXAnchor.constraint(equalTo: countView.centerXAnchor).isActive = true
                    numLabel.centerYAnchor.constraint(equalTo: countView.centerYAnchor).isActive = true
                    
                    countView.layer.cornerRadius = 8
                    countView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                    
                    rightbutton.addSubview(countView)
                }
            }
            
        
        }
        if images.count == 0 && (buttonTitles?.count ?? 0) > 0 {
            for (i,_) in (buttonTitles ?? []).enumerated() {
                let rightbutton = UIButton(type: .custom)
                rightbutton.contentHorizontalAlignment = .right
                rightbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 33)
                rightbutton.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 18)!
                rightbutton.contentHorizontalAlignment = .right
                
                if let buttonTitles = buttonTitles {
                    rightbutton.setTitle(buttonTitles[i], for: .normal)
                }
                
                if let buttonColors = buttonColors {
                    rightbutton.setTitleColor(buttonColors[i], for: .normal)
                }else {
                    rightbutton.setTitleColor(.colorValue(), for: .normal)
                }
                
                rightbutton.isEnabled = isEnable
                
                if let selectors = selectors {
                    rightbutton.addTarget(self, action: selectors[i], for: .touchUpInside)
                }
                rightBarButton.append(UIBarButtonItem(customView: rightbutton))
            
            }
        }
        
        self.navigationItem.rightBarButtonItems = rightBarButton
        // Set leftBar button properties
        // Default Back icon image "00CommonAppBarMainBackIconGrey"
        
        let leftButton = UIButton(type: .custom)
        if leftImage == nil {
            leftButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }else {
            leftButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        leftButton.contentHorizontalAlignment = .left
        leftButton.frame = CGRect(x: 0, y: 0, width: 50, height: 33)
        leftButton.setImage(leftImage, for: .normal)
        leftButton.setTitle(leftBarTitle, for: .normal)
        leftButton.setTitleColor(UIColor.colorValue(), for: .normal)
        
        
        // Use back system as default if leftSelector not set
        if let selector = leftSelector {
            leftButton.addTarget(self, action: selector, for: .touchUpInside)
            
        }
        
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
    }
    
    func alert(title: String = "", message: String = "", okbtn: String = "confirm", completion: @escaping Completion = { }) {
        if let jsonData = message.data(using: String.Encoding.utf8) {
            do {
                try JSONSerialization.jsonObject(with: jsonData)
                alertJsonError(title: title, message: message)
            }
            catch {
//                customAlertPopup(titleStr: title, message: message, confirmText: okbtn, confirmAction: completion)
            }
        }
    }
    
    private func alertJsonError(title: String, message: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.left
        
        let messageText = NSMutableAttributedString(
            string: message,
            attributes: [
                NSAttributedString.Key.paragraphStyle: paragraphStyle,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12),
                NSAttributedString.Key.foregroundColor : UIColor.black
            ]
        )
        
        let alert   = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok      = UIAlertAction(title: "confirm", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.setValue(messageText, forKey: "attributedMessage")
        alert.definesPresentationContext = true
        
        var frontViewController = self
        
        while ((frontViewController.presentedViewController != nil) && frontViewController != frontViewController.presentedViewController!) {
            frontViewController = frontViewController.presentedViewController!
        }
        
        frontViewController.present(alert, animated: true, completion: nil)
    }
    
    func convertDictionaryToJSON(_ dictionary: [String: Any]) -> String? {

       guard let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) else {
          print("Something is wrong while converting dictionary to JSON data.")
          return nil
       }

       guard let jsonString = String(data: jsonData, encoding: .utf8) else {
          print("Something is wrong while converting JSON data to JSON string.")
          return nil
       }

       return jsonString
    }
}


// MARK: - Clicked/Tap Animation
extension UIViewController {
    
    func push(storyboardName: String, viewControllerID: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentScreen(to identifier: String, storyboardName: String, modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: identifier)
        destinationVC.modalPresentationStyle = modalPresentationStyle
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    func animateButton(button: UIButton, scale: CGFloat = 0.96, duration: TimeInterval = 0.09, delay:TimeInterval = 0.0 , completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            button.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: 0.09) {
                button.transform = CGAffineTransform.identity
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    completion()
                }
            }
        })
    }
    
    func animateView(view: UIView, scale: CGFloat = 0.95, duration: TimeInterval = 0.09,delay:TimeInterval = 0.0, completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: duration) {
                view.transform = CGAffineTransform.identity
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    completion()
                }
            }
        })
    }
    

    
    
    func animateImageView(image: UIImageView, scale: CGFloat = 0.95, duration: TimeInterval = 0.09, delay: TimeInterval = 0.0, completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            image.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: duration) {
                image.transform = CGAffineTransform.identity
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    completion()
                }
            }
        })
    }
    
    func animateLabel(label: UILabel, scale: CGFloat = 0.96, duration: TimeInterval = 0.09, delay:TimeInterval = 0.0 , completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            label.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: 0.09) {
                label.transform = CGAffineTransform.identity
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    completion()
                }
            }
        })
    }
    
    
    
}


extension UICollectionViewCell {
    
    func animateView(view: UIView, scale: CGFloat = 0.95, duration: TimeInterval = 0.09, completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: duration) {
                view.transform = CGAffineTransform.identity
                DispatchQueue.main.async {
                    completion()
                }
            }
        })
    }
}


extension UITableViewCell {
    func animateButton(button: UIButton, scale: CGFloat = 0.96, duration: TimeInterval = 0.09, completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            button.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: 0.09) {
                button.transform = CGAffineTransform.identity
                DispatchQueue.main.async {
                    completion()
                }
            }
        })
    }
    
    func animateView(view: UIView, scale: CGFloat = 0.95, duration: TimeInterval = 0.09, completion: @escaping () -> Void) {
        UIView.animate(withDuration: duration, animations: {
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            UIView.animate(withDuration: duration) {
                view.transform = CGAffineTransform.identity
                DispatchQueue.main.async {
                    completion()
                }
            }
        })
    }
}

