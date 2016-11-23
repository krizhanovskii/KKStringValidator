
//
//  Copyright (c) 2016 k_krizhanovskii. All rights reserved.
//

import Foundation
import UIKit

/// helps create debug message
///
/// - Parameters:
///   - clas: class instance
///   - message: message to be shown
/// - Returns: string in format "DEBUG:class:message"
public func debugMessage(_ clas:Any, message:String) -> String {
    return "DEBUG:\(clas.self):\(message)"
}


public protocol Criteriable {
    /// debug string for debug description of problem
    var debugErrorString : String {get}
    
    /// Check if value comform to criteria
    ///
    /// - Parameter value: value to be checked
    /// - Returns: return true if comform
    func isComform(to value:String) -> Bool
}



/// list
public struct LengthCriteria : Criteriable  {
    public var debugErrorString: String =  debugMessage(LengthCriteria.self, message:"Lenght less than {X}")
    
    private var lenght : Int
    
    public init(_ lenght : Int) {
        self.lenght = lenght
        self.debugErrorString = debugMessage(LengthCriteria.self, message:"Lenght less than 10")
    }
    
    public func isComform(to value: String) -> Bool {
        return value.characters.count >= lenght
    }
}



public struct UppercaseLetterExistCriteria : Criteriable {
    public var debugErrorString: String = debugMessage(UppercaseLetterExistCriteria.self, message:"no uppercase char exist")
    
    public func isComform(to value: String) -> Bool {
        for char in value.characters {
            if String(char).uppercased() == String(char) && Int(String(char)) == nil {
                return true
            }
        }
        return false
    }
}


public struct LowercaseLetterExistCriteria : Criteriable {
    public var debugErrorString: String = debugMessage(LowercaseLetterExistCriteria.self, message:"no lowwercase char exist")
    
    public func isComform(to value: String) -> Bool {
        for char in value.characters {
            if String(char).lowercased() == String(char) && Int(String(char)) == nil {
                return true
            }
        }
        return false
    }
}


public struct NumberExistCriteria : Criteriable {
    public var debugErrorString: String = debugMessage(NumberExistCriteria.self, message:"no number char exist")
    
    
    public func isComform(to value: String) -> Bool {
        for char in value.characters {
            if let _ = Int(String(char)) {
                return true
            }
        }
        return false
    }
}


public struct RegexpCriteria : Criteriable {
    
    public var debugErrorString: String
    private var regexp : String
    
    public init(_ regExp:String) {
        self.debugErrorString = debugMessage(RegexpCriteria.self, message:"no mutch to regexp \(regExp)")
        self.regexp = regExp
    }
    
    public func isComform(to value: String) -> Bool {
        let regExptest = NSPredicate(format: "SELF MATCHES %@", regexp)
        return regExptest.evaluate(with: value)
    }
    
}
