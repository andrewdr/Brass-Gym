//
//  ScaleImages.swift
//  Brass-Gym
//
//  Created by The Clout on 8/5/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import Foundation
import UIKit

let majorImages:[UIImage] = [#imageLiteral(resourceName: "c-major")]

let minorImages:[UIImage] = [#imageLiteral(resourceName: "c-natural-minor"), #imageLiteral(resourceName: "c-harmonic-minor"), #imageLiteral(resourceName: "c-melodic-minor")]

let modalImages:[UIImage] = [#imageLiteral(resourceName: "c-dorian"), #imageLiteral(resourceName: "c-phrygian"), #imageLiteral(resourceName: "c-lydian"), #imageLiteral(resourceName: "c-lydian-dominnat"), #imageLiteral(resourceName: "c-mixolydian"), #imageLiteral(resourceName: "c-locrian")]

var selectedImages:[UIImage] = []

var flatMapImages:[UIImage] = []


func addMajImg(){
    selectedImages.append(contentsOf: majorImages)
}

func addMinorImg(){
    selectedImages.append(contentsOf: minorImages)
}

func addModalImg(){
    selectedImages.append(contentsOf: modalImages)
}

func removeMajImg(){
    selectedImages = Array(Set(selectedImages).subtracting(majorImages))
}

func removeMinorImg(){
    selectedImages = Array(Set(selectedImages).subtracting(minorImages))
}

func removeModalImg(){
    selectedImages = Array(Set(selectedImages).subtracting(modalImages))
}

