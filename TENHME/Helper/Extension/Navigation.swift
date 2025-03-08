//
//  Navigation.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

extension UIViewController{
    
    func navigation(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(hexString: "#1075AC")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    func getCGSizeText(st: String, fontSize: CGFloat) -> CGSize {
            let font = UIFont.systemFont(ofSize: fontSize)
            let fontAtrr = [NSAttributedString.Key.font: font]
            let size = (st as NSString).size(withAttributes: fontAtrr)
            return size
        }

    func setLeftNavigationItem(_ image:String, action:Selector, title:String, width: CGFloat) -> Void {
            
            // Image
            let image_nav = UIImage(named: image)
            
            // Button
            let leftNavBtn = UIButton()
            leftNavBtn.setImage(image_nav, for: UIControl.State())
            leftNavBtn.setTitle(title, for: UIControl.State())
            leftNavBtn.titleLabel!.font = UIFont.systemFont(ofSize: 17)
            let autoWidth = getCGSizeText(st: title, fontSize: 17).width
//            let frameBtnTitle = CGRect(x: 56,y: 0,width: image_nav!.size.width + autoWidth, height: image_nav!.size.height)
            let frameBtn = CGRect(x: 56,y: 0,width: image_nav!.size.width + autoWidth, height: image_nav!.size.height)
            leftNavBtn.frame = frameBtn
            leftNavBtn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -26, bottom: 0, right: 0)
            leftNavBtn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 0)
        leftNavBtn.contentHorizontalAlignment = .center
            leftNavBtn.addTarget(self, action: action, for: UIControl.Event.touchUpInside)
            
            // leftBarButtonItem
            let leftBarButtonItem = UIBarButtonItem(customView: leftNavBtn)
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    
    func pushNavigation(rootView: UIViewController, storyboard: String, identifier: String) {
        let vc = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
        rootView.navigationController?.pushViewController(vc, animated: true)
    }

}
