//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Michael Renninger on 11/24/14.
//  Copyright (c) 2014 Michael Renninger. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubBelly() {
        println("\(name): Purr Purr")
    }
    
    override func roar () {
        super.roar()
        println("\(name): Growl Growl")
    }
    
    override func randomFact() -> String {
        var fact = ""
        if isAlphaMale {
            fact = "Cubs are usually hidden in the dense bush for approximately six weeks"
        } else {
            fact = "Cubs begin eating meat at about the age of six weeks"
        }
        return fact
    }
}