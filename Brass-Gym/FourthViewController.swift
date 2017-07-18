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
    @IBOutlet weak var startStopBtnTxt: UIButton!

    
    var metTimer: Timer!
    var metIsOff = true
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
    
    @IBAction func startStopBtn(_ sender: UIButton) {
        
        if metIsOff{
            startMet()
        }else{
            stopMet()
        }
        
    }
    
    func startMet(){
    
        metIsOff = false
        let metTimeInterval: TimeInterval = 60.0 / tempo
        metTimer = Timer.scheduledTimer(timeInterval: metTimeInterval, target: self, selector: #selector(FourthViewController.playSound), userInfo: nil, repeats: true)
        metTimer?.fire()
        startStopBtnTxt.setTitle("Stop", for: .normal)
        tempoStepper.isEnabled = false
    }
    
    func stopMet(){
    
        metIsOff = true
        metTimer?.invalidate()
        startStopBtnTxt.setTitle("Start", for: .normal)
        tempoStepper.isEnabled = true
    }

    func playSound(){
        metPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tempo = 100
        let metSoundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "metronomeClick", ofType: "mp3")!)
        metPlayer = try! AVAudioPlayer(contentsOf: metSoundURL)
        metPlayer.prepareToPlay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
