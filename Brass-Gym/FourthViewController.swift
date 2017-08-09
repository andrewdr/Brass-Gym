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
    @IBOutlet weak var startStopBtnTxt: UIButton!
    @IBOutlet weak var tempoSlider: UISlider!
    


    
    var metTimer: Timer!
    var metIsOff = true
    var metPlayer: AVAudioPlayer!

    var tempo: TimeInterval = 60 {
        didSet{
            tempoSlider.value = Float(tempo)
            tempoDisplay.text = String(Int(tempo))
        }
    }
    
    
    @IBAction func newTempo(_ sender: UISlider) {
        
        tempoSlider.minimumValue = 50
        tempoSlider.maximumValue = 180
        tempo = TimeInterval(tempoSlider.value)
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

        
    
        UIApplication.shared.isIdleTimerDisabled = true
        
    }
    
    func stopMet(){
    
        metIsOff = true
        metTimer?.invalidate()
        startStopBtnTxt.setTitle("Start", for: .normal)
        UIApplication.shared.isIdleTimerDisabled = false
    }

    func playSound(){
        metPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        tempo = 100
        tempoSlider.value = Float(tempo)
        tempoSlider.isContinuous = true
        

        
        let metSoundURL = URL(fileURLWithPath: Bundle.main.path(forResource: "metronomeClick", ofType: "mp3")!)
        metPlayer = try! AVAudioPlayer(contentsOf: metSoundURL)
        metPlayer.prepareToPlay()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
