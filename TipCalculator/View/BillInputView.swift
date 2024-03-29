//
//  BillInputView.swift
//  TipCalculator
//
//  Created by Shamil on 25/8/2023.
//

import UIKit
import Combine
import CombineCocoa

class BillInputView: UIView {
    
    // MARK: - Properties
    
    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure("Enter",
                       bottomText: "your bill")
        return view
    }()
    
    private let textFieldContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(8)
        return view
    }()
    
    private let currencyDenominationLabel: UILabel = {
        let label = LabelFactory.build("$",
                                       font: ThemeFont.bold(24))
        label.setContentHuggingPriority(.defaultHigh,
                                        for: .horizontal)
        return label
    }()
    
    private let billSubject: PassthroughSubject<Double, Never> = .init()
    
    var valuePublisher: AnyPublisher<Double, Never> {
        billSubject.eraseToAnyPublisher()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.font = ThemeFont.demiBold(28)
        textField.keyboardType = .decimalPad
        textField.setContentHuggingPriority(.defaultLow,
                                            for: .horizontal)
        textField.tintColor = ThemeColor.text
        textField.textColor = ThemeColor.text
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: frame.size.width,
                                              height: 36))
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil),
            doneButton
        ]
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        return textField
    }()
    
    // MARK: - Initialisation
    
    init() {
        super.init(frame: .zero)
        layout()
        observe()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func layout() {
        [headerView, textFieldContainerView].forEach { view in
            addSubview(view)
        }
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.width.equalTo(68)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        textFieldContainerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView.addSubview(textField)
        currencyDenominationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
    }
    
    private func observe() {
        textField.textPublisher.sink { [weak self] text in
            let doubleValue = text?.doubleValue ?? 0
            self?.billSubject.send(doubleValue)
        }.store(in: &cancellables)
    }
    
    @objc private func doneButtonTapped() {
        textField.endEditing(true)
    }
}
