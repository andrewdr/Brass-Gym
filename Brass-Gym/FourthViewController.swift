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
    var metronome: Metronome = {
        let highUrl = Bundle.main.url(forResource: "metronomeClick", withExtension: "mp3")!
//        let lowUrl = Bundle.main.url(forResource: "metronomeClick", withExtension: "mp3")!
        return Metronome(accentedClickFile: highUrl)
    }()


    var tempo: Int = 0 {
        
        didSet {
        tempoDisplay.text = String(self.tempo)
        }
    }
    
    @IBAction func newTempo(_ sender: UISlider) {
        
        tempoSlider.minimumValue = 30
        tempoSlider.maximumValue = 200
        tempo = Int(tempoSlider.value)
    }
    
    
    @IBAction func startStopBtn(_ sender: UIButton) {
        
        if metIsOff{
             metronome.play(bpm: Double(Float(tempo)))
             startText()
        }else{
            metronome.stop()
            stopText()
        }
    }
    
    func startText(){
    
        metIsOff = false
        startStopBtnTxt.setTitle("Stop", for: .normal)
        tempoSlider.isEnabled = false
        UIApplication.shared.isIdleTimerDisabled = true
        
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("An error occured")
        }
    }
    
    func stopText(){
        metIsOff = true
        startStopBtnTxt.setTitle("Start", for: .normal)
        UIApplication.shared.isIdleTimerDisabled = false
        tempoSlider.isEnabled = true
    }

    func playSound(){
        metPlayer.play()
    }
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
  
        tempo = 100
        tempoSlider.value = Float(tempo)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    }
