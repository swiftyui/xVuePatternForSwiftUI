//
// Copyright (c) Vatsal Manot
//
import Combine
import Swift
import SwiftUI

//A drop-in replacement for @State that allows for observing the state as a stream of events. It exposes two publishers, willSet and didSet.

//https://github.com/SwiftUIX/SwiftUIX/blob/b2c61977f123291c08f10f665d1e5e7bd9af75e2/Sources/Intramodular/Dynamic%20Properties/ObservableState.swift

/// A @State-like property wrapper that offers affordances for observing value changes as a stream of publisher events.
@propertyWrapper
public struct ObservableState<Value>: DynamicProperty {
    public typealias ValueChange = (oldValue: Value, newValue: Value)
    
    @State private var _willChange: PassthroughSubject<ValueChange, Never>
    @State private var _didChange: PassthroughSubject<ValueChange, Never>
    @State private var _wrappedValue: (previous: Value?, current: Value)
    
    /// An observable stream of value changes, before they happen.
    public var willChange: AnyPublisher<ValueChange, Never> {
        return _willChange.eraseToAnyPublisher()
    }
    
    /// An observable stream of value changes, after they happen.
    public var didChange: AnyPublisher<ValueChange, Never> {
        return _didChange.eraseToAnyPublisher()
    }
    
    /// The current state value.
    public var wrappedValue: Value {
        get {
            _wrappedValue.current
        } nonmutating set {
            let current = _wrappedValue.current
            
            defer {
                _didChange.send((current, newValue))
            }
            
            _willChange.send((current, newValue))
            
            _wrappedValue = (_wrappedValue.current, newValue)
        }
    }
    
    /// The binding value, as "unwrapped" by accessing `$foo` on a `@Binding` property.
    public var projectedValue: Binding<Value> {
        return .init(
            get: { self.wrappedValue },
            set: { self.wrappedValue = $0 }
        )
    }
    
    /// Initialize with the provided initial value.
    public init(wrappedValue value: Value) {
        self.__willChange = .init(initialValue: .init())
        self.__didChange = .init(initialValue: .init())
        self.__wrappedValue = .init(initialValue: (nil, value))
    }
    
    public mutating func update() {
        self.__wrappedValue.update()
    }
}

struct ObservableStateDemo: View {
    @ObservableState var foo: Int = 0

    let observation: AnyCancellable?

    init() {
        observation = _foo.willChange.sink {
            print($0.oldValue, $0.newValue)
        }
    }

    var body: some View {
        Button(action: { self.foo += 1 }) {
            Text("Increment")
        }
    }
}


struct ObservableStateDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ObservableStateDemo()
        }
    }
}
