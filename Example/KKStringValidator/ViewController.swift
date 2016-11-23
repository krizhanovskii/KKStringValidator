//
//  ViewController.swift
//  KKStringValidator
//
//  Created by k_krizhanovskii on 11/23/2016.
//  Copyright (c) 2016 k_krizhanovskii. All rights reserved.
//

import UIKit
import KKStringValidator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var lennghtCriteria = LengthCriteria(4)
        let regexpCriteria = RegexpCriteria("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
        
        //validator
        StringValidator([lennghtPredictor,UppercaseLetterExistCriteria,LowercaseLetterExistCriteria,NumberExistCriteria(),regexpPredictor]).isValide("q1Q", forceExit: false, result: { validator in
            switch validator {
            case .valid:
                print("All valid")
            case .notValid(let criteria):
                print(criteria.debugErrorString)
            case .notValides(let criterias):
                print("Criterias that fails:")
                _ = criterias.map({ print($0.debugErrorString)
                })
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

