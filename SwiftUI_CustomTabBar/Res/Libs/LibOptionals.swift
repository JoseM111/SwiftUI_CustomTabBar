import Foundation

// MARK: -∆  Extension On Optional  ━━━━━━━━━━━━━━━━━━━
/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

extension Optional {
    
    // MARK: ™━━━━━━━━━━━━ [Over-Loading `or`] ━━━━━━━━━━━━™
    
    /// Return the value of the Optional or the `default` parameter
    /// - param: The value to return if the optional is empty
    func or(default: Wrapped) -> Wrapped {
        //∆..........
        return self ?? `default`
    }
    
    /// Returns the unwrapped value of the optional *or*
    /// the result of an expression `else`
    /// I.e. optional.or(else: print("Arrr"))
    func or(else: @autoclosure () -> Wrapped) -> Wrapped {
        //∆..........
        return self ?? `else`()
    }
    
    /// Returns the unwrapped value of the optional *or*
    /// the result of calling the closure `else`
    /// I.e. optional.or(else: {
    /// ... do a lot of stuff
    /// })
    func or(else: () -> Wrapped) -> Wrapped {
        //∆..........
        return self ?? `else`()
    }
    
    /// Returns the unwrapped contents of the optional if it is not empty
    /// If it is empty, throws exception `throw`
    func or(throw exception: Error) throws -> Wrapped {
        //∆..........
        guard let unwrapped = self else { throw exception }
        return unwrapped
    }
    
}
// MARK: END OF: Optional

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: -™  EXTENSION OF: [( where Wrapped == Error )] ━━━━━━━━━━━━

extension Optional where Wrapped == Error {
    
    // MARK: ™━━━━━━━━━━━━ [or] ━━━━━━━━━━━━™
    
    /// Only perform `else` if the optional has a non-empty error value
    func or(`else`: (Error) -> Void) {
        //∆..........
        guard let error = self else { return }
        `else`(error)
    }
}
// MARK: END OF: Optional

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

///∆ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
///  •`Map` As we saw above, `map` and `flatMap` are the only methods
///    that Swift offers on `Optionals`. However, even those can be
///    improved a bit to be more versatile in many situations. There're
///    two additional variations on map that allow defining a default
///    value similar to how the or variants above are implemented:
///  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

extension Optional {
    
    /// Maps the output *or* returns the default value if the optional is nil
    /// - parameter fn: The function to map over the value
    /// - parameter or: The value to use if the optional is empty
    func map<T>(mapOverValue: (Wrapped) throws -> T, default: T) rethrows -> T {
        //∆..........
        return try map(mapOverValue) ?? `default`
    }
    
    /// Maps the output *or* returns the result of calling `else`
    /// - parameter fn: The function to map over the value
    /// - parameter else: The function to call if the optional is empty
    func map<T>(mapOverValue: (Wrapped) throws -> T, else: () throws -> T) rethrows -> T {
        //∆..........
        return try map(mapOverValue) ?? `else`()
    }
}
// MARK: END OF: Optional

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


/**━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ [ EXAMPLE ] ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 
 /// ™ Default Value
 ///   The first one returns the wrapped value
 ///   of the optional or a default value:
 
 `let optional: Int? = nil`
 `print("™ Default Value: \(optional.or(else: 10))")`
 
 /// ™ Default Closure
 ///   The second one is very similar to the first one, however it
 ///   allows to return a default value from a closure instead.
 
 `let secretValue: Int = 10`
 `print("™ Default Closure: \(optional.or(else: secretValue * 17))")`
 
 /// ™ A really nice use case for or is code where you only
 ///   want to set a value on an optional if it is empty:
 `struct DataBase {`
 // MARK: - ™PROPERTIES™
 ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 `let failure: String = "failure"`
 `let amountOfUsers: Int = 3`
 ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 
 `func preFetch() { }`
 `}`
 
 `let userCount: Int? = nil`
 
 `func example() -> Int {`
 //∆..........
 `userCount.or(else: {`
 //∆..........
 `let db = DataBase()`
 `db.preFetch()`
 
 `guard db.failure.isEmpty else { return 0 }`
 
 `return db.amountOfUsers`
 `})`
 `}`
 
 
 `let optional1: String? = "Alias_One11"`
 `let optional2: String? = nil`
 
 `print(optional1.map(mapOverValue: { $0.count }, default: 0))` /// default <- 11 characters
 
 `print(optional2.map(mapOverValue: { $0.count }, default: 0))` /// default <- to 0 since its nil
 
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━*/


