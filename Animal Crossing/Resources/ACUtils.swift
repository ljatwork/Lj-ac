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

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        var hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }
        var rgbValue:UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        let alpha = CGFloat(1.0)
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

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

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
    
    func isValidEmail() -> Bool {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
