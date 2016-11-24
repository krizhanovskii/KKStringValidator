//
//  Extensions.swift
//  Pods
//
//  Created by Krizhanovskii on 11/24/16.
//
//

import Foundation


extension Character {
    //chek if char is lowercase
    public func isLowercase() -> Bool {
        let set = CharacterSet.lowercaseLetters
        
        if let scala = UnicodeScalar(String(self)) {
            return set.contains(scala)
        } else {
            return false
        }
    }
    
    //chek if char is uppercase
    public func isUppercase() -> Bool {
        let set = CharacterSet.uppercaseLetters
        
        if let scala = UnicodeScalar(String(self)) {
            return set.contains(scala)
        } else {
            return false
        }
    }
}
