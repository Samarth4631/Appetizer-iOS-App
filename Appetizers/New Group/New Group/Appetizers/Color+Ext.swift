//
//  Color+Ext.swift
//  Appetizers
//
//  Created by samarth srivastava  on 02/10/26.
//

import SwiftUI

extension Color {
    static let appBrandPrimary = Color("brandPrimary")
}

#if canImport(UIKit)
import UIKit
extension UIColor {

    static var uiAppBrandPrimary: UIColor { UIColor(named: "brandPrimary") ?? .systemBlue }
}
#endif

