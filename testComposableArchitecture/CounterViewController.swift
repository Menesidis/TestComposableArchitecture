//
//  CounterViewController.swift
//  testComposableArchitecture
//
//  Created by Menesidis on 8/11/20.
//

import UIKit
import ComposableArchitecture
import Combine

final class CounterViewController: UIViewController {

    @IBOutlet weak var totalCountValueLabel: UILabel!

    let viewStore: ViewStore<CounterState, CounterAction>
    var cancellables: Set<AnyCancellable> = []
    
    init(store: Store<CounterState, CounterAction>) {
      self.viewStore = ViewStore(store)
      super.init(nibName: nil, bundle: nil)
    }

    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewStore
            .publisher
            .map { $0.title }
            .assign(to: \.title, on: self)
            .store(in: &self.cancellables)
        
        viewStore
            .publisher
            .map {"\($0.count)"}
            .assign(to: \.text, on: totalCountValueLabel)
            .store(in: &self.cancellables)
        
        viewStore
            .publisher
            .map {
                switch $0.resultState {
                case .negative:
                    return .red
                case .positive:
                    return .green
                case .zero:
                    return .gray
                }
            }
            .assign(to: \.textColor, on: totalCountValueLabel)
            .store(in: &self.cancellables)
        
    }

    @IBAction func multiplyButtonTapped(_ sender: Any) {
        viewStore.send(.multiplyButtonTapped)
    }
    
    @IBAction func subtractButtonTapped(_ sender: Any) {
        viewStore.send(.subtractButtonTapped)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        self.viewStore.send(.addButtonTapped)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        self.viewStore.send(.clearButtonTapped)
    }
}
