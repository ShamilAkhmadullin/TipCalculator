//
//  CalculatorViewController.swift
//  TipCalculator
//
//  Created by Shamil on 24/8/2023.
//

import UIKit
import SnapKit
import Combine

class CalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoView = LogoView()
    private let resultView = ResultView()
    private let billInputView = BillInputView()
    private let tipInputView = TipInputView()
    private let splitInputView = SplitInputView()
    private let calculatorViewModel = CalculatorViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoView,
            resultView,
            billInputView,
            tipInputView,
            splitInputView,
            UIView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 36
        return stackView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        bind()
    }
    
    // MARK: - Private functions
    
    private func layout() {
        view.backgroundColor = ThemeColor.background
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leadingMargin).offset(16)
            make.trailing.equalTo(view.snp.trailingMargin).offset(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
            make.bottom.equalTo(view.snp.bottomMargin).offset(-16)
        }
        logoView.snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        resultView.snp.makeConstraints { make in
            make.height.equalTo(224)
        }
        billInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
        tipInputView.snp.makeConstraints { make in
            make.height.equalTo(56+56+16)
        }
        splitInputView.snp.makeConstraints { make in
            make.height.equalTo(56)
        }
    }
    
    private func bind() {
        let input = CalculatorViewModel.Input(billPublisher: Just(10).eraseToAnyPublisher(),
                                              tipPublisher: tipInputView.valuePublisher,
                                              splitPublisher: Just(5).eraseToAnyPublisher())
        let output = calculatorViewModel.transform(input)
        output.updateViewPublisher.sink { result in
            print("\(#function) Result: \(result)")
        }.store(in: &cancellables)
    }
}
