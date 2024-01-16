//
//  TipInputView.swift
//  TipCalculator
//
//  Created by Shamil on 25/8/2023.
//

import UIKit

class TipInputView: UIView {
    
    // MARK: - Properties
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure("Choose",
                       bottomText: "your tip")
        return view
    }()
    
    private lazy var tenPercentTipButton: UIButton = {
        let button = buildTipButton(.tenPercent)
        return button
    }()
    
    private lazy var fifteenPercentTipButton: UIButton = {
        let button = buildTipButton(.tenPercent)
        return button
    }()
    
    private lazy var twentyPercentTipButton: UIButton = {
        let button = buildTipButton(.tenPercent)
        return button
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom tip",
                        for: .normal)
        button.titleLabel?.font = ThemeFont.bold(20)
        button.backgroundColor = ThemeColor.primary
        button.tintColor = .white
        button.addCornerRadius(8.0)
        return button
    }()
    
    private lazy var buttonHStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            tenPercentTipButton,
            fifteenPercentTipButton,
            twentyPercentTipButton
        ])
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var buttonVStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            buttonHStackView,
            customTipButton
        ])
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .vertical
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
        [headerView, buttonVStackView].forEach(addSubview(_:))
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(buttonVStackView.snp.leading).offset(-24)
            make.width.equalTo(68)
            make.centerY.equalTo(buttonHStackView.snp.centerY)
        }
        buttonVStackView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }
    }
    
    private func buildTipButton(_ tip: Tip) -> UIButton {
        let button = UIButton(type: .custom)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(8.0)
        let text = NSMutableAttributedString(string: tip.stringValue,
                                             attributes: [
                                                .font: ThemeFont.bold(20),
                                                .foregroundColor: UIColor.white
                                             ])
        text.addAttributes([.font: ThemeFont.demiBold(14)],
                           range: NSMakeRange(2, 1))
        button.setAttributedTitle(text,
                                  for: .normal)
        return button
    }
}
