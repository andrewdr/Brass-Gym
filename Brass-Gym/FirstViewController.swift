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

    var sendScale = "Scale 1"


    @IBAction func majorSwitch(_ sender: UISwitch) {
        if majSwitchValue.isOn{
            addMajors()
        }else{
        removeMajors()
        }
    }
    @IBAction func minorSwitch(_ sender: UISwitch) {
        if minorOnlySwitch.isOn{
        addMinors()
        }else{
        removeMinors()
        }
    }
    @IBAction func modesSwitch(_ sender: UISwitch) {
        if modesOnlySwitch.isOn{
        addModes()
        }else{
        removeModes()
        }
    }
    
    @IBAction func symmetricSwitch(_ sender: UISwitch) {
        if symmetricOnlySwitch.isOn{
        addSymmetrics()
        }else{
        removeSymmetrics()
        }
    }

    @IBAction func getScaleDetail(_ sender: Any) {
        sendScale = scaleTypeLabel.text!
    }

    
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
        
            getScaleType()
    
    }
    
    func getScaleType(){
        
        if selectedScales == []{
            scaleTypeLabel.text = majorScales[0]
        }else{
        
        flatMapScales = selectedScales.flatMap({$0})
        randomScaleType = Int(arc4random_uniform(UInt32(flatMapScales.count)))
        scaleTypeLabel.text = flatMapScales[randomScaleType]
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

