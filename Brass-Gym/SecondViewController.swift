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
    
    
    @IBAction func flexButton(_ sender: Any) {
        getFlexType()
    }
    

    @IBAction func osOnlySwitch(_ sender: UISwitch) {
        if (sender.isOn) {
        flexTypeRandom = 0
        } else{
        flexTypeRandom = Int(arc4random_uniform(UInt32(flexType.count)))
        }
    }
    
    @IBAction func flipsOnlySwitch(_ sender: UISwitch) {
        if (sender.isOn){
        flexTypeRandom = 1
        } else{
        flexTypeRandom = Int(arc4random_uniform(UInt32(flexType.count)))
        }
    }

    
    var flexTypeRandom = 0
    

 
    
    func getFlexType() {

        flexTypeRandom = Int(arc4random_uniform(UInt32(flexType.count)))
        
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

