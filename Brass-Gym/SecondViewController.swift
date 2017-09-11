//
//  SecondViewController.swift
//  Brass-Gym
//
//  Created by The Clout on 7/9/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var flexTypeLabel: UILabel!
    @IBOutlet weak var flexDetailLabel: UILabel!
    @IBOutlet weak var flipDirectionLabel: UILabel!
    @IBOutlet weak var osValue: UISwitch!
    @IBOutlet weak var flipSwitch: UISwitch!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var flexImage: UIImageView!

    
    
    
    @IBAction func flexButton(_ sender: Any) {
        getFlexType()
        getFlexImage()
        flexImage.isHidden = false
    }
    

    @IBAction func osOnlySwitch(_ sender: UISwitch) {
        if (sender.isOn) {
        flexTypeRandom = 0
        }
    }
    
    @IBAction func flipsOnlySwitch(_ sender: UISwitch) {
        if (sender.isOn){
        flexTypeRandom = 1
        }
    }

    
    var flexTypeRandom = 0
    
    func getRandomNumber(){
    
        if osValue.isOn {
            flexTypeRandom = 0
        } else if flipSwitch.isOn {
            flexTypeRandom = 1
        } else if osValue.isOn && flipSwitch.isOn {
            flexTypeRandom = Int(arc4random_uniform(UInt32(flexType.count)))
        } else {
            flexTypeRandom = Int(arc4random_uniform(UInt32(flexType.count)))
        }
    }

 
    
    func getFlexType() {

        getRandomNumber()
        
        flexDetailLabel.isHidden = false
        
        if flexTypeRandom == 0 {
            flexTypeLabel.text = flexType[0]
        }else{
            flexTypeLabel.text = flexType[1]
        }
        
        func getFlexDetail(){
            let oldSchoolRandom = Int(arc4random_uniform(UInt32(oldSchoolFlex.count)))
            let flipsRandom = Int(arc4random_uniform(UInt32(flips.count)))
            
            if flexTypeRandom == 0{
                flexDetailLabel.text = oldSchoolFlex[oldSchoolRandom]
            } else if flexTypeRandom == 1{
                flexDetailLabel.text = flips[flipsRandom]
            }
        }
        getFlexDetail()
        
        func getFlipDirection(){
            
            let upDownRandom = Int(arc4random_uniform(UInt32(flipDirection.count)))
            
            if flexTypeRandom == 1{
                flipDirectionLabel.text = flipDirection[upDownRandom]
                flipDirectionLabel.isHidden = false
            }else {
                flipDirectionLabel.isHidden = true
            }
        }
        getFlipDirection()
        
        let flexUp = "Flex Flow Up"
        let flexDown = "Flex Flow Down"
        
        if flexDetailLabel.text == flexUp{
            getFlexFlowNote()
        }else if flexDetailLabel.text == flexDown{
            getFlexFlowNote()
        }else{
            noteLabel.isHidden = true
        }
    }
    
    func getFlexFlowNote(){
        let randomNumber = Int(arc4random_uniform(UInt32(notes.count)))
        noteLabel.text = notes[randomNumber]
        noteLabel.isHidden = false
    }
    
    func getFlexImage(){
        if flexDetailLabel.text == oldSchoolFlex[0]{
            flexImage.image = #imageLiteral(resourceName: "flex-root")
        }else if flexDetailLabel.text == oldSchoolFlex[1]{
            flexImage.image = #imageLiteral(resourceName: "flex-3rd")
        }else if flexDetailLabel.text == oldSchoolFlex[2]{
            flexImage.image = #imageLiteral(resourceName: "flex-5th")
        }else if flexDetailLabel.text == oldSchoolFlex[3]{
            flexImage.image = #imageLiteral(resourceName: "Flex-remmington")
        }else if flexDetailLabel.text == oldSchoolFlex[4]{
            flexImage.image = #imageLiteral(resourceName: "flex-slamma")
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

