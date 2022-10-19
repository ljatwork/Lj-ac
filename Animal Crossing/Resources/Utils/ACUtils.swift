//
//  ACUtils.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import UIKit


class ACUtils {
    // this function will apply the rounded image effect
    static func applyRoundedCorners(img: UIImageView){
        // force border radius, use circular mask
        img.layer.cornerRadius = img.frame.size.height / 2;
        img.layer.masksToBounds = true
    }
    
    // this function will apply the rounded view effect
    static func applyRoundedCorners(view: UIView, cornerRadius: CGFloat){
        // force border radius, use circular mask
        view.layer.name = "roundCorner"
        view.layer.cornerRadius = cornerRadius;
        view.layer.masksToBounds = true
    }
    
    static func defaultAppFont(weight: FontWeight = .regular, fontSize: CGFloat = UIFont.systemFontSize) -> UIFont {
        let font = UIFont(name: "Verdana\(weight.rawValue)", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        return font
    }
}
