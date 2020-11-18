//
//  CounterReducer.swift
//  testComposableArchitecture
//
//  Created by Menesidis on 8/11/20.
//

import Foundation
import ComposableArchitecture

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
        state.count += 1
        state.resultState = state.count.toResultState()
        return .none
    case .subtractButtonTapped:
        state.count -= 1
        state.resultState = state.count.toResultState()
        return .none
    case .multiplyButtonTapped:
        state.count *= state.count
        state.resultState = state.count.toResultState()
        return .none
    case .clearButtonTapped:
        state.count = 0
        state.resultState = state.count.toResultState()
        return .none
    }
}
