//
//  CounterReducer.swift
//  testComposableArchitecture
//
//  Created by Menesidis on 8/11/20.
//

import Foundation
import ComposableArchitecture
import Calculator

enum ResultState: Equatable {
    case negative
    case positive
    case zero
}

extension Double {
    func toResultState() -> ResultState {
        if self > 0 {
            return .positive
        } else if self < 0 {
            return .negative
        } else {
            return .zero
        }
    }
}

struct CounterState: Equatable {
    var count: Double = 0.0
    var title: String = "Counter!"
    var resultState: ResultState = .zero
}

enum CounterAction: Equatable {
  case addButtonTapped
  case subtractButtonTapped
  case multiplyButtonTapped
  case clearButtonTapped
}

struct CounterEnvironment {}

let counterReducer = Reducer<CounterState, CounterAction, CounterEnvironment> { state, action, environment in
    switch action {
    case .addButtonTapped:
        state.count = state.count.add()
        state.resultState = state.count.toResultState()
        return .none
    case .subtractButtonTapped:
        state.count = state.count.subtract()
        state.resultState = state.count.toResultState()
        return .none
    case .multiplyButtonTapped:
        state.count = state.count.multiply()
        state.resultState = state.count.toResultState()
        return .none
    case .clearButtonTapped:
        state.count = state.count.clear()
        state.resultState = state.count.toResultState()
        return .none
    }
}
