//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Michael Renninger on 11/21/14.
//  Copyright (c) 2014 Michael Renninger. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var img = UIImage(named:"")
    var facts = [
        "The Tiger is the biggest species in the cat family",
        "Tigers can reach a length of 3.3 meters",
        "A group of tigers is known as an 'ambush' or 'streak'"
    ]
    
    func chuff() {
        println("\(name): Chuff Chuff")
    }
    
//    func chuffNums(num:Int) {
//        for var i = 0; i < num; ++i {
//            chuff()
//        }
//    }
    
    func chuffNums (num:Int, isLoud:Bool = true) {
        for var i = 1; i <= num; i++ {
            if isLoud {
                chuff()
            } else {
                println("\(name): Purr Purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge(age:Int) -> Int {
        return age * 3
    }
    
    func randomFact() -> String {
        let num = Int(arc4random_uniform(UInt32(3)))
        return facts[num]
    }
}