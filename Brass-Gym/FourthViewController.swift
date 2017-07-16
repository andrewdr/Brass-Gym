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
    
    var metTimer: Timer!
    var metIsOn = true
    var metPlayer: AVAudioPlayer!

    var tempo: TimeInterval = 60 {
        didSet{
            tempoStepper.value = Double(tempo)
            tempoDisplay.text = String(Int(tempo))
        }
    }
    
    @IBAction func selectTempo(_ sender: UIStepper) {
        
        tempoStepper.minimumValue = 0.0
        tempoStepper.maximumValue = 250.0
        tempo = tempoStepper.value
    }
    
//    @IBAction func startStopBtn(_ sender: UIButton) {
//        
//        if metIsOn == false{
//            startMet()
//        }else{
//            stopMet()
//        }
//        
//    }
//    
//    func startMet(){
//    
//        metIsOn = true
//        let metTimeInterval: TimeInterval = 60.0 / tempo
//        metTimer = Timer.scheduledTimer(timeInterval: metTimeInterval, target: self, selector: #selector(FourthViewController.playSound), userInfo: nil, repeats: true)
//        metTimer?.fire()
//        tempoStepper.isEnabled = false
//    }
//    
//    func stopMet(){
//    
//        metIsOn = false
//        metTimer?.invalidate()
//        tempoStepper.isEnabled = true
//    }
//
//    func playSound(){
//    
//    }
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tempo = 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
