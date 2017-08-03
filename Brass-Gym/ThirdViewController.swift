//
//  ThirdViewController.swift
//  Brass-Gym
//
//  Created by The Clout on 7/13/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    var randomNumber = 0
    
    @IBOutlet weak var dynamicDisplay: UILabel!
    @IBOutlet weak var dynamicsImage: UIImageView!
    
  
    
    @IBAction func getDynamics(_ sender: Any) {
        randomNumber = Int(arc4random_uniform(UInt32(dynamics.count)))
        dynamicDisplay.text = dynamics[randomNumber]
    }
    
    @IBAction func getDynamicScheme(_ sender: Any) {
        randomNumber = Int(arc4random_uniform(UInt32(schemes.count)))
        dynamicDisplay.text = schemes[randomNumber]
        showImage()
    }
    
    func showImage(){
        if dynamicDisplay.text == schemes[5]{
            dynamicsImage.image = #imageLiteral(resourceName: "Diamond-bowtie")
            dynamicsImage.isHidden = false
        }else{
            dynamicsImage.isHidden = true
        } 
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
