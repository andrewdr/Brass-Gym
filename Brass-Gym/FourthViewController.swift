//
//  FourthViewController.swift
//  Brass-Gym
//
//  Created by The Clout on 7/15/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import UIKit
import AVFoundation

class FourthViewController: UIViewController {
    
    @IBOutlet weak var tempoDisplay: UILabel!
    @IBOutlet weak var tempoStepper: UIStepper!
    
    var Timer: Timer!
    var metIsOn = false
    var metPlayer: AVAudioPlayer!
    var tempo = 120
    
    
    @IBAction func tempoSelector(_ sender: UIStepper) {
        
        var newTempo = tempoStepper.value
        
        tempoStepper.value = Double(tempo)
        tempoDisplay.text = newTempo
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tempo = 120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
