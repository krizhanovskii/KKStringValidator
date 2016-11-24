//
//  UITextFieldExtension.swift
//  Pods
//
//  Created by Krizhanovskii on 11/24/16.
//
//

import Foundation
import UIKit


/// extension for UITextField for validation
extension UITextField {
    
    /// function for validating textField text
    ///
    /// - Parameters:
    ///   - criterias: array of criterias
    ///   - forceExit: flag for force extit. default in false
    ///   - result: ValidatorResult object
    public func validate(_ criterias : [Criteriable], forceExit:Bool = false, result:@escaping (ValidatorResult)->Void) {
        StringValidator(criterias).isValide(self.text ?? "", forceExit: forceExit, result: result)
    }
}
