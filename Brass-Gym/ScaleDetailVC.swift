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
            scaleText.text = dorianText
        }else if receivedScale == modalScales[1]{
            scaleImage.image = #imageLiteral(resourceName: "c-phrygian")
            scaleText.text = phrygianText
        }else if receivedScale == modalScales[2]{
            scaleImage.image = #imageLiteral(resourceName: "c-lydian")
            scaleText.text = lydianText
        }else if receivedScale == modalScales[3]{
            scaleImage.image = #imageLiteral(resourceName: "c-lydian-dominnat")
            scaleText.text = lydianDomText
        }else if receivedScale == modalScales[4]{
            scaleImage.image = #imageLiteral(resourceName: "c-mixolydian")
            scaleText.text = mixolydianText
        }else if receivedScale == modalScales[5]{
            scaleImage.image = #imageLiteral(resourceName: "c-locrian")
            scaleText.text = locrianText
        }else if receivedScale == symmetricScales[0]{
            scaleImage.image = #imageLiteral(resourceName: "octatonic-whole")
            scaleText.text = octaWholeText
        }else if receivedScale == symmetricScales[1]{
            scaleImage.image = #imageLiteral(resourceName: "octatonic-half")
            scaleText.text = octaHalfText
        }else if receivedScale == symmetricScales[2]{
            scaleImage.image = #imageLiteral(resourceName: "chromatic-up")
            scaleText.text = chromaticText
        }else if receivedScale == symmetricScales[3]{
            scaleImage.image = #imageLiteral(resourceName: "chromatic-down")
            scaleText.text = chromaticText
        }else if receivedScale == symmetricScales[4]{
            scaleImage.image = #imageLiteral(resourceName: "whole-tone")
            scaleText.text = wholeToneText
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
