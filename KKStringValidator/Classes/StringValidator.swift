//  Copyright (c) 2016 k_krizhanovskii. All rights reserved.
import UIKit
import Foundation




/// Validator result object
///
/// - valid: everething is ok
/// - notValid: find not valid prediction
/// - notValide: find not valid array of predictions
public enum ValidatorResult {
    case valid
    case notValid(criteria:Criteriable)
    case notValides(criterias:[Criteriable])
}


/// Validator
public struct StringValidator  {
    /// predictions
    public var criterias: [Criteriable]
    
    ///init
    public init(_ criterias: [Criteriable]) {
        self.criterias = criterias
    }
    
    /// validate redictors to comform
    ///
    /// - Parameters:
    ///   - value: string that must be validated
    ///   - forceExit: if true -> stop process when first validation is fail. else create array of fail criterias
    ///   - result: result of validating
    public func isValide(_ value:String,forceExit:Bool, result:@escaping  (ValidatorResult) -> ()) {
        /// if need force quit
        if forceExit == true {
            for criteria in self.criterias {
                if criteria.isСonform(to: value) == false {
                    result(.notValid(criteria: criteria))
                    return
                }
            }
        } else {
            //else find all
            let tmp = criterias.filter({ $0.isСonform(to: value) == false})
            if tmp.count > 0 {
                result(.notValides(criterias: tmp))
                return
            }
        }
        // if not find -> return all ok
        result(.valid)
    }
}


