//
//  CalculatorViewModel.swift
//  TipCalculator
//
//  Created by Akhmadullin, Shamil on 8/2/2024.
//

import Foundation
import Combine

class CalculatorViewModel {
    
    struct Input {
        let billPublisher: AnyPublisher<Double, Never>
        let tipPublisher: AnyPublisher<Tip, Never>
        let splitPublisher: AnyPublisher<Int, Never>
    }
    
    struct Output {
        let updateViewPublisher: AnyPublisher<Result, Never>
    }
    
    func transform(_ input: Input) -> Output {
        let result = Result(amountPerPerson: 500,
                            totalBill: 1000,
                            totalTip: 50.0)
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
}
