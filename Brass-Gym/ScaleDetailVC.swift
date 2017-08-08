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
    var receivedImg: UIImage?
    
    
    @IBOutlet weak var scaleType: UILabel!
    @IBOutlet weak var scaleImage: UIImageView!
    
//    func getScaleImage(){
//        
//        if receivedScale == majorScales[0]{
//            scaleImage.image = #imageLiteral(resourceName: "c-major")
//        }else if receivedScale == minorScales[0] {
//            scaleImage.image = #imageLiteral(resourceName: "c-natural-minor")
//        }else if receivedScale == minorScales[1]{
//            scaleImage.image = #imageLiteral(resourceName: "c-harmonic-minor")
//        }else if receivedScale == minorScales[2]{
//            scaleImage.image = #imageLiteral(resourceName: "c-melodic-minor")
//        }else if receivedScale == modalScales[0]{
//            scaleImage.image = #imageLiteral(resourceName: "c-dorian")
//        }else if receivedScale == modalScales[1]{
//            scaleImage.image = #imageLiteral(resourceName: "c-phrygian")
//        }else if receivedScale == modalScales[2]{
//            scaleImage.image = #imageLiteral(resourceName: "c-lydian")
//        }else if receivedScale == modalScales[3]{
//            scaleImage.image = #imageLiteral(resourceName: "c-lydian-dominnat")
//        }else if receivedScale == modalScales[4]{
//            scaleImage.image = #imageLiteral(resourceName: "c-mixolydian")
//        }else if receivedScale == modalScales[5]{
//            scaleImage.image = #imageLiteral(resourceName: "c-locrian")
//        }else{
//            scaleImage.image = #imageLiteral(resourceName: "c-major")
//        }
//        
//    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        scaleType.text = receivedScale
        scaleImage.image = receivedImg
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
