//
//  LogoView.swift
//  TipCalculator
//
//  Created by Shamil on 25/8/2023.
//

import UIKit

class LogoView: UIView {
    
    // MARK: - Properties
    
    private let calculatorImageView: UIImageView = {
        let imageView = UIImageView(image: .init(named: "Calculator"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "Mr. TIP",
                                             attributes: [.font: ThemeFont.demiBold(16)])
        text.addAttributes([.font: ThemeFont.bold(24)],
                           range: NSMakeRange(4, 3))
        label.attributedText = text
        return label
    }()
    
    private let bottomLabel: UILabel = {
        LabelFactory.build("Calculator",
                           font: ThemeFont.demiBold(20),
                           textAlingment: .left)
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            topLabel,
            bottomLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = -4
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            calculatorImageView,
            verticalStackView
        ])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
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
        addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        calculatorImageView.snp.makeConstraints { make in
            make.height.equalTo(calculatorImageView.snp.width)
        }
    }
}
