//
//  UIViewController+Preview.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/21/20.
//

import Foundation
import SwiftUI

/// - https://fluffy.es/xcode-previews-uikit/

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // for swiftui binding only
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}

struct InfoVCPreview: PreviewProvider {
    static var devices = ["iPhone 8", "iPhone 8 Plus", "iPhone 11 Pro Max"]
    
    static var previews: some View {
        let vc = LoginViewController()
        let nav =  UINavigationController(rootViewController: vc)
        ForEach(devices, id: \.self) { deviceName in
            nav.toPreview().previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}
#endif

// The following values are supported:
//
//     "iPhone 8"
//     "iPhone 8 Plus"
//     "iPhone SE"
//     "iPhone 11"
//     "iPhone 11 Pro"
//     "iPhone 11 Pro Max"
//     "iPad mini 4"
//     "iPad Air 2"
//     "iPad Pro (9.7-inch)"
//     "iPad Pro (12.9-inch)"
//     "iPad (5th generation)"
//     "iPad Pro (12.9-inch) (2nd generation)"
//     "iPad Pro (10.5-inch)"
//     "iPad (6th generation)"
//     "iPad Pro (11-inch)"
//     "iPad Pro (12.9-inch) (3rd generation)"
//     "iPad mini (5th generation)"
//     "iPad Air (3rd generation)"
//     "Apple TV"
//     "Apple TV 4K"
//     "Apple TV 4K (at 1080p)"
//     "Apple Watch Series 2 - 38mm"
//     "Apple Watch Series 2 - 42mm"
//     "Apple Watch Series 3 - 38mm"
//     "Apple Watch Series 3 - 42mm"
//     "Apple Watch Series 4 - 40mm"
//     "Apple Watch Series 4 - 44mm"
