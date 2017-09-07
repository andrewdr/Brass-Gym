//
//  ScaleDetailVC.swift
//  Brass-Gym
//
//  Created by The Clout on 7/19/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import UIKit

class ScaleDetailVC: UIViewController {
    
    var receivedScale = "scale"

    
    
    @IBOutlet weak var scaleType: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    @IBOutlet weak var scaleText: UITextView!
    
    func getScaleImage(){
        
        if receivedScale == majorScales[0]{
            scaleImage.image = #imageLiteral(resourceName: "c-major")
            scaleText.text = majorText
        }else if receivedScale == minorScales[0] {
            scaleImage.image = #imageLiteral(resourceName: "c-natural-minor")
            scaleText.text = naturalMinorText
        }else if receivedScale == minorScales[1]{
            scaleImage.image = #imageLiteral(resourceName: "c-harmonic-minor")
            scaleText.text = harmonicMinorText
        }else if receivedScale == minorScales[2]{
            scaleImage.image = #imageLiteral(resourceName: "c-melodic-minor")
            scaleText.text = melodicMinorText
        }else if receivedScale == minorScales[3]{
            scaleImage.image = #imageLiteral(resourceName: "blues")
            scaleText.text = bluesText
        }else if receivedScale == modalScales[0]{
            scaleImage.image = #imageLiteral(resourceName: "c-dorian")
        }else if receivedScale == modalScales[1]{
            scaleImage.image = #imageLiteral(resourceName: "c-phrygian")
        }else if receivedScale == modalScales[2]{
            scaleImage.image = #imageLiteral(resourceName: "c-lydian")
        }else if receivedScale == modalScales[3]{
            scaleImage.image = #imageLiteral(resourceName: "c-lydian-dominnat")
        }else if receivedScale == modalScales[4]{
            scaleImage.image = #imageLiteral(resourceName: "c-mixolydian")
        }else if receivedScale == modalScales[5]{
            scaleImage.image = #imageLiteral(resourceName: "c-locrian")
        }else if receivedScale == symmetricScales[0]{
            scaleImage.image = #imageLiteral(resourceName: "octatonic-whole")
        }else if receivedScale == symmetricScales[1]{
            scaleImage.image = #imageLiteral(resourceName: "octatonic-half")
        }else if receivedScale == symmetricScales[2]{
            scaleImage.image = #imageLiteral(resourceName: "chromatic-up")
        }else if receivedScale == symmetricScales[3]{
            scaleImage.image = #imageLiteral(resourceName: "chromatic-down")
        }else if receivedScale == symmetricScales[4]{
            scaleImage.image = #imageLiteral(resourceName: "whole-tone")
        }else{
            scaleImage.image = #imageLiteral(resourceName: "c-major")
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        scaleType.text = receivedScale
        getScaleImage()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
