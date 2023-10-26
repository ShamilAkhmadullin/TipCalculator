//
//  TipInputView.swift
//  TipCalculator
//
//  Created by Shamil on 25/8/2023.
//

import UIKit

class TipInputView: UIView {
    
    // MARK: - Initialisation
    
    init() {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func layout() {
        backgroundColor = .systemPink
    }
}
