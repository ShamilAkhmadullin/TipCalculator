//
//  ThemeFont.swift
//  TipCalculator
//
//  Created by Shamil on 25/8/2023.
//

import UIKit

struct ThemeFont {
    static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular",
                      size: size) ?? .systemFont(ofSize: size)
    }
    
    static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold",
                      size: size) ?? .systemFont(ofSize: size)
    }
    
    static func demiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold",
                      size: size) ?? .systemFont(ofSize: size)
    }
}
