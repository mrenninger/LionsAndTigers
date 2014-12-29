//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Michael Renninger on 11/21/14.
//  Copyright (c) 2014 Michael Renninger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var breedLbl: UILabel!
    @IBOutlet weak var factLbl: UILabel!
    
    var tigers:[Tiger] = []
    var tigerDetails = [
        (name:"Tigger", breed:"Bengal", age:3, img:"BengalTiger.jpg"),
        (name:"Tigress", breed:"Indochinese", age:2, img:"IndochineseTiger.jpg"),
        (name:"Jacob", breed:"Malayan", age:4, img:"MalayanTiger.jpg"),
        (name:"Spar", breed:"Siberian", age:5, img:"SiberianTiger.jpg")
    ]
    
    var lions:[Lion] = []
    var cubs:[Lion] = []
    var lionDetails = [
        (name:"Mufasa", subspecies:"West African", age:4, img:"Lion.jpg", isAlphaMale:false),
        (name:"Sarabi", subspecies:"Barbary", age:3, img:"Lioness.jpeg", isAlphaMale:false),
        (name:"Simba", subspecies:"Masai", age:1, img:"LionCub1.jpg", isAlphaMale:true),
        (name:"Nala", subspecies:"Transvaal", age:1, img:"LionCub2.jpeg", isAlphaMale:false)
    ]
    
    var curIndex = 0
    
    var curAnimal = (species:"Tiger", index:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for var i = 0; i < tigerDetails.count; i++ {
            var tTiger = Tiger()
            tTiger.name = tigerDetails[i].name
            tTiger.breed = tigerDetails[i].breed
            tTiger.age = tigerDetails[i].age
            tTiger.img = UIImage(named: tigerDetails[i].img)
            tigers.append(tTiger)
            println("My Tiger's name is \(tTiger.name), it's age is \(tTiger.age), it's breed is \(tTiger.breed), and it's image is \(tTiger.img)")
        }
        
        for var i = 0; i < tigers.count; i++ {
            tigers[i].age = tigers[i].ageInTigerYearsFromAge(tigers[i].age)
        }
        
        myImageView.image = tigers[curIndex].img
        nameLbl.text = tigers[curIndex].name
        ageLbl.text = "\(tigers[curIndex].age)"
        breedLbl.text = tigers[curIndex].breed
        factLbl.text = tigers[curIndex].randomFact()
        
        tigers[0].chuffNums(5, isLoud:false)
        
        // ************ Lions
        for var i = 0; i < lionDetails.count; i++ {
            var tLion:Lion = lionDetails[i].age > 2 ? Lion() : LionCub()
            
            tLion.name = lionDetails[i].name
            tLion.subspecies = lionDetails[i].subspecies
            tLion.age = lionDetails[i].age
            tLion.img = UIImage(named: lionDetails[i].img)
            lions.append(tLion)
            
            if tLion.age <= 2 { cubs.append(tLion) }
            
            println("My Lion's name is \(tLion.name), it's age is \(tLion.age), it's subspecies is \(tLion.subspecies), and it's image is \(tLion.img)")
        }
        lions[0].roar()
        lions[1].roar()
        lions[0].changeToAlphaMale()
        println(lions[0].isAlphaMale)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onNextBtnPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }
    
    func updateAnimal() {
        switch curAnimal {
        case ("Tiger", _):
            let randIndex = Int(arc4random_uniform(UInt32(lions.count)))
            curAnimal = ("Lion", randIndex)
        default:
            let randIndex = Int(arc4random_uniform(UInt32(tigers.count)))
            curAnimal = ("Tiger", randIndex)
        }
    }
    
    func updateView () {
        UIView.transitionWithView(
            self.view,
            duration: 0.5,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                if self.curAnimal.species == "Tiger" {
                    let tiger = self.tigers[self.curAnimal.index]
                    self.myImageView.image = tiger.img
                    self.breedLbl.text = tiger.breed
                    self.ageLbl.text = "\(tiger.age)"
                    self.nameLbl.text = tiger.name
                    self.factLbl.text = tiger.randomFact()
                } else if self.curAnimal.species == "Lion" {
                    let lion = self.lions[self.curAnimal.index]
                    self.myImageView.image = lion.img
                    self.breedLbl.text = lion.subspecies
                    self.ageLbl.text = "\(lion.age)"
                    self.nameLbl.text = lion.name
                    self.factLbl.text = lion.randomFact()
                }
                self.factLbl.hidden = false
            },
            completion: {
                (finished: Bool) -> () in
            }
        )

    }
}

