//
//  ScaleTypes.swift
//  Brass-Gym
//
//  Created by The Clout on 7/9/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import Foundation

let notes:[String] = ["A", "A♭", "B", "B♭", "C", "C♯", "D", "D♭", "E", "E♭", "F", "F♯", "G", "G♭"]

let scaleType:[String] = ["Major", "Natural Minor", "Harmonic Minor", "Melodic Minor", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Lydian Dominant", "Octatonic(W)", "Octatonic(H)", "Chromatic(up)", "Chromatic(down)", "Whole Tone", "Locrian"]

let majorScales:[String] = ["Major"]

let minorScales:[String] = ["Natural Minor", "Harmonic Minor", "Melodic Minor"]

let modalScales:[String] = ["Dorian", "Phrygian", "Lydian","Lydian Dominant", "Mixolydian", "Locrian"]

let symmetricScales:[String] = ["Octatonic(W)", "Octatonic(H)", "Chromatic(up)", "Chromatic(down)", "Whole Tone"]

var selectedScales:[String] = []

var flatMapScales:[String] = []


func addMajors(){
    selectedScales.append(contentsOf: majorScales)
}

func addMinors(){
    selectedScales.append(contentsOf: minorScales)
}

func addModes(){
    selectedScales.append(contentsOf: modalScales)
}

func addSymmetrics(){
    selectedScales.append(contentsOf: symmetricScales)
}

func removeMajors(){
    selectedScales = Array(Set(selectedScales).subtracting(majorScales))
}

func removeMinors(){
    selectedScales = Array(Set(selectedScales).subtracting(minorScales))
}

func removeModes(){
    selectedScales = Array(Set(selectedScales).subtracting(modalScales))
}

func removeSymmetrics(){
    selectedScales = Array(Set(selectedScales).subtracting(symmetricScales))
}










