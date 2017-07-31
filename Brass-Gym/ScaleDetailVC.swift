//
//  ScaleDetailVC.swift
//  Brass-Gym
//
//  Created by The Clout on 7/19/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import UIKit

class ScaleDetailVC: UIViewController {
    
    var receivedScale = "Scale"
    
    
    @IBOutlet weak var scaleType: UILabel!
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        scaleType.text = receivedScale
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
