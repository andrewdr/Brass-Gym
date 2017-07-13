//
//  ScaleTypes.swift
//  Brass-Gym
//
//  Created by The Clout on 7/9/17.
//  Copyright © 2017 Draper. All rights reserved.
//

import Foundation

let notes:Array = ["A", "A♭", "B", "B♭", "C", "C#", "D", "D♭", "E", "E♭", "F", "F#", "G", "G♭"]

let scaleType:Array = ["Major", "Natural Minor", "Harmonic Minor", "Melodic Minor", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Lydian Dominant", "Octatonic(W)", "Octatonic(H)", "Chromatic(up)", "Chromatic(down)", "Whole Tone", "Locrian"]

let majorScales:Array = ["Major"]

let minorScales:Array = ["Natural Minor", "Harmonic Minor", "Melodic Minor"]

let modalScales:Array = ["Dorian", "Phrygian", "Lydian","Lydian Dominant", "Mixolydian", "Locrian"]

let symmetricScales:Array = ["Octatonic(W)", "Octatonic(H)", "Chromatic(up)", "Chromatic(down)", "Whole Tone"]

var allScales:Array = [String]()


func addArray(){

    allScales.append(String(describing: majorScales))
    print(allScales)
}
