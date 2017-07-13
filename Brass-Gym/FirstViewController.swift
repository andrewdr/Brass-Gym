//
//  FirstViewController.swift
//  Brass-Gym
//
//  Created by The Clout on 7/9/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var scaleTypeLabel: UILabel!
    @IBOutlet weak var majSwitchValue: UISwitch!
    @IBOutlet weak var minorOnlySwitch: UISwitch!
    @IBOutlet weak var modesOnlySwitch: UISwitch!
    @IBOutlet weak var symmetricOnlySwitch: UISwitch!




    
    
    @IBAction func randomScaleBtn(_ sender: Any) {
        getRandomScale()
    }
    
    
    var randomScaleType = 0
    
    func getRandomScale() {
        
        let previousNote = 0
    
        var randomNote = Int(arc4random_uniform(UInt32(notes.count)))
        
        if randomNote == previousNote {
            randomNote = Int(arc4random_uniform(UInt32(notes.count)))
        }
        
        noteNameLabel.text = notes[randomNote]
        
        if majSwitchValue.isOn {
           scaleTypeLabel.text = scaleType[0]
        }else if minorOnlySwitch.isOn {
            randomScaleType = Int(arc4random_uniform(UInt32(minorScales.count)))
            scaleTypeLabel.text = minorScales[randomScaleType]
        }else if modesOnlySwitch.isOn {
            randomScaleType = Int(arc4random_uniform(UInt32(modalScales.count)))
            scaleTypeLabel.text = modalScales[randomScaleType]
        }else if symmetricOnlySwitch.isOn {
            randomScaleType = Int(arc4random_uniform(UInt32(symmetricScales.count)))
            scaleTypeLabel.text = symmetricScales[randomScaleType]
        }else{
            randomScaleType = Int(arc4random_uniform(UInt32(scaleType.count)))
            scaleTypeLabel.text = scaleType[randomScaleType]
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

