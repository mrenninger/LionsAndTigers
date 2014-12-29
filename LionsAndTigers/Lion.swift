//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Michael Renninger on 11/24/14.
//  Copyright (c) 2014 Michael Renninger. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var img = UIImage(named:"")
    var name = ""
    var subspecies = ""
    
    func roar () {
        println("\(name): Roar Roar")
    }
    
    func changeToAlphaMale() {
        self.isAlphaMale = true;
    }
    
    func randomFact() -> String {
        var fact = ""
        if self.isAlphaMale {
            fact = "Male lions are easy to recognize thanks to their distinctive manes.  Males with darker manes are more likely to attract females."
        } else {
            fact = "Female lions form the stable social unit and do not tolerate outside females."
        }
        return fact
    }
}