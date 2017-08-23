//
//  Metronome.swift
//  MetronomeIdeaOnAVAudioEngine
//
//  Created by Alex Shubin on 26.03.17.
//  Copyright © 2017 Alex Shubin. All rights reserved.
//

import AVFoundation

class Metronome {
    
    private var audioPlayerNode:AVAudioPlayerNode
    private var audioFileMainClick:AVAudioFile
    private var audioFileAccentedClick:AVAudioFile
    private var audioEngine:AVAudioEngine
    private var engineStart: AVAudioEngine?
    private var mainBufferStart: AVAudioFile?
    private var accentBufferStart: AVAudioFile?
    
    init (mainClickFile: URL, accentedClickFile: URL? = nil) {
        
        var mainFile: AVAudioFile?
        var accentedFile: AVAudioFile?
        var enginePrep: AVAudioEngine?

        
        do{
            let getMainFile = try AVAudioFile(forReading: mainClickFile)
            mainFile = getMainFile
        }catch{
            print("An error occurred")
        }
        audioFileMainClick = mainFile!
        
        do{
            let getAccentFile = try AVAudioFile(forReading: accentedClickFile!)
            accentedFile = getAccentFile
        }catch{
            print("An error occurred")
        }
        audioFileAccentedClick = accentedFile!
        
//      audioFileAccentedClick = try! AVAudioFile(forReading: accentedClickFile ?? mainClickFile)
        
        audioPlayerNode = AVAudioPlayerNode()
        
        audioEngine = AVAudioEngine()
        audioEngine.attach(self.audioPlayerNode)
        
        audioEngine.connect(audioPlayerNode, to: audioEngine.mainMixerNode, format: audioFileMainClick.processingFormat)
//          try! audioEngine.start()
        
        do{
           let getEngine =  try AVAudioEngine(audioEngine.start())
           enginePrep = getEngine
            
        }catch{
            print("An error occurred")
        }
        
        engineStart = enginePrep
        
        
    }
    
    private func generateBuffer(bpm: Double) -> AVAudioPCMBuffer {
        
        var mainBufferPrep: AVAudioFile?
        var accentBufferPrep: AVAudioFile?
        
        audioFileMainClick.framePosition = 0
        audioFileAccentedClick.framePosition = 0
        
        let beatLength = AVAudioFrameCount(audioFileMainClick.processingFormat.sampleRate * 60 / bpm)
        
        let bufferMainClick = AVAudioPCMBuffer(pcmFormat: audioFileMainClick.processingFormat, frameCapacity: beatLength)
//        try! audioFileMainClick.read(into: bufferMainClick)
        
        do{
            let getBufferMain = try AVAudioFile(audioFileMainClick.read(into: bufferMainClick))
            mainBufferPrep = getBufferMain
        
        }catch{
            print("An error occurred")
        }
        
        mainBufferStart = mainBufferPrep
        
        
        bufferMainClick.frameLength = beatLength
        
        let bufferAccentedClick = AVAudioPCMBuffer(pcmFormat: audioFileMainClick.processingFormat, frameCapacity: beatLength)
//        try! audioFileAccentedClick.read(into: bufferAccentedClick)
        do{
            let getBufferAccent = try AVAudioFile(audioFileAccentedClick.read(into: bufferAccentedClick))
            accentBufferPrep = getBufferAccent
            
        }catch{
            print("An error occurred")
        }
        
            accentBufferStart = accentBufferPrep
        
        bufferAccentedClick.frameLength = beatLength
        
        let bufferBar = AVAudioPCMBuffer(pcmFormat: audioFileMainClick.processingFormat, frameCapacity: 4 * beatLength)
        bufferBar.frameLength = 4 * beatLength
        
        // don't forget if we have two or more channels then we have to multiply memory pointee at channels count
        let accentedClickArray = Array(
            UnsafeBufferPointer(start: bufferAccentedClick.floatChannelData?[0],
                                count:Int(audioFileMainClick.processingFormat.channelCount) * Int(beatLength))
        )
        let mainClickArray = Array(
            UnsafeBufferPointer(start: bufferMainClick.floatChannelData?[0],
                                count:Int(audioFileMainClick.processingFormat.channelCount) * Int(beatLength))
        )
        
        var barArray = Array<Float>()
        // one time for first beat
        barArray.append(contentsOf: accentedClickArray)
        // three times for regular clicks
        for _ in 1...3 {
            barArray.append(contentsOf: mainClickArray)
        }
        
        bufferBar.floatChannelData?.pointee.assign(from: barArray,
                                                   count: Int(audioFileMainClick.processingFormat.channelCount) * Int(bufferBar.frameLength))
        
        return bufferBar
    }
    
    func play(bpm: Double) {
        
        let buffer = generateBuffer(bpm: bpm)
        
        if audioPlayerNode.isPlaying {
            audioPlayerNode.scheduleBuffer(buffer, at: nil, options: .interruptsAtLoop, completionHandler: nil)
        } else {
            self.audioPlayerNode.play()
        }
        
        self.audioPlayerNode.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
        
    }
    
    func stop() {
        audioPlayerNode.stop()
    }
    
}
