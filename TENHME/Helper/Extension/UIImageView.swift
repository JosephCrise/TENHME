//
//  UIImageView.swift
//  TENHME
//
//  Created by Sam Sophanna on 3/5/25.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
//        self.kf.setImage(with: url)
    }
    
}
