//
//  LabelFactory.swift
//  TipCalculator
//
//  Created by Shamil on 25/8/2023.
//

import UIKit

struct LabelFactory {
    static func build(
        _ text: String?,
        font: UIFont,
        backgroundColor: UIColor = .clear,
        textColor: UIColor = ThemeColor.text,
        textAlingment: NSTextAlignment = .center) -> UILabel {
            let label = UILabel()
            label.text = text
            label.font = font
            label.backgroundColor = backgroundColor
            label.textColor = textColor
            label.textAlignment = textAlingment
            return label
        }
}
