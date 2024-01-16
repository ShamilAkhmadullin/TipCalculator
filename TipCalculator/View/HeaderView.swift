//
//  HeaderView.swift
//  TipCalculator
//
//  Created by Akhmadullin, Shamil on 16/1/2024.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: - Properties

    private let topLabel: UILabel = {
        LabelFactory.build(nil,
                           font: ThemeFont.bold(18))
    }()

    private let bottomLabel: UILabel = {
        LabelFactory.build(nil,
                           font: ThemeFont.regular(16))
    }()

    private let topSpacerView = UIView()
    private let bottomSpacerView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            topSpacerView,
            topLabel,
            bottomLabel,
            bottomSpacerView
        ])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = -4
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
    
    // MARK: - Functions
    
    func configure(_ topText: String,
                   bottomText: String) {
        topLabel.text = topText
        bottomLabel.text = bottomText
    }
    
    // MARK: - Private functions
    
    private func layout() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        topSpacerView.snp.makeConstraints { make in
            make.height.equalTo(bottomSpacerView)
        }
    }
}
