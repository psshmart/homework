//
//  CustomFonts.swift
//  homework_2
//
//  Created by Svetlana Safonova on 07.12.2021.
//

import UIKit

enum Style: String {
    case light = "Light"
    case bold = "Bold"
    case semibold = "SemiBold"
    case regular = "Regular"
}

extension UIFont {
    static func habibiFont(style: Style, size: CGFloat) -> UIFont {
        UIFont(name: "Habibi-\(style.rawValue)", size: size) ?? UIFont()
    }
}
