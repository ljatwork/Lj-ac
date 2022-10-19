//
//  ACUtils+UIView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/2/20.
//

import Foundation
import UIKit

extension UIView {
    func addDropShadow(_ shadowColor: UIColor = UIColor.black) {
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        layer.shadowOpacity = 0.2
        layer.shadowPath = shadowPath.cgPath
    }
}


