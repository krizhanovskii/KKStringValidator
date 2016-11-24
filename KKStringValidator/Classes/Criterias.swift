
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
    /// - Returns: return true if conform
    func isСonform(to value:String) -> Bool
}



/// list


/// Check string length
public struct LengthCriteria : Criteriable  {
    public var debugErrorString: String =  debugMessage(LengthCriteria.self, message:"Length less than {X}")
    
    private var length : Int
    
    public init(_ lenght : Int) {
        self.length = lenght
        self.debugErrorString = debugMessage(LengthCriteria.self, message:"Length less than \(length)")
    }
    
    public func isСonform(to value: String) -> Bool {
        return value.characters.count >= length
    }
}


/// Check if string contains one or more Uppercase char
public struct UppercaseLetterExistCriteria : Criteriable {
    public var debugErrorString: String = debugMessage(UppercaseLetterExistCriteria.self, message:"no uppercase char exists")
    
    public init(){}
    
    public func isСonform(to value: String) -> Bool {
        for char in value.characters {
            if char.isUppercase() == true {
                return true
            }
        }
        return false
    }
}

/// Check if string contains one or more lowercase char
public struct LowercaseLetterExistCriteria : Criteriable {
    public var debugErrorString: String = debugMessage(LowercaseLetterExistCriteria.self, message:"no lowercase char exists")
    
    public init(){}

    public func isСonform(to value: String)  -> Bool {
        for char in value.characters {
            if char.isLowercase() == true {
                return true
            }
        }
        return false
    }
    
}

/// Check if string contains one or more number
public struct NumberExistCriteria : Criteriable {
    public var debugErrorString: String = debugMessage(NumberExistCriteria.self, message:"no number char exists")
    
    public init(){}

    public func isСonform(to value: String) -> Bool {
        let regExptest = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        return regExptest.evaluate(with: value)
    }
}

/// Check if string conform to RegExp
public struct RegexpCriteria : Criteriable {
    
    public var debugErrorString: String
    private var regexp : String
    
    public init(_ regExp:String) {
        self.debugErrorString = debugMessage(RegexpCriteria.self, message:"no match to regexp \(regExp)")
        self.regexp = regExp
    }
    
    public func isСonform(to value: String) -> Bool {
        let regExptest = NSPredicate(format: "SELF MATCHES %@", regexp)
        return regExptest.evaluate(with: value)
    }
}

/// Check if string length between to values
public struct RangeCriteria : Criteriable {
    
    public var debugErrorString: String
    
    private var from : Int
    private var to: Int
    
    public init(_ from:Int = 0, to:Int = 0) {
        guard to>from else {
            fatalError("from value (\(from)) must be less than to value(\(to))")
        }
        self.debugErrorString = debugMessage(RangeCriteria.self, message:"string length must be from \(from) to \(to)")
        self.from = from
        self.to = to
    }
    
    public func isСonform(to value: String) -> Bool {
        return value.characters.count > from && value.characters.count <= to
    }
}


/// check if first char is Letter. Also optional check big letter
public struct FirstCharIsLetterCriteria : Criteriable {
    
    public var debugErrorString: String
    private var isBig : Bool
    
    public init(big:Bool = false) {
        var mess = "first char must be letter"
        if big == true {
            mess += " and in uppercase"
        }
        self.debugErrorString = debugMessage(FirstCharIsLetterCriteria.self, message:mess)
        self.isBig = big
    }
    
    public func isСonform(to value: String) -> Bool {
        if value.characters.count == 0 {
            return false
        }
        
        return Int(String(value.characters.first!)) == nil && (self.isBig == false ? true : value.characters.first!.isUppercase())
    }
}

