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
    private var audioFileAccentedClick:AVAudioFile
    private var audioEngine:AVAudioEngine
    private var engineStart: AVAudioEngine?
    private var mainBufferStart: AVAudioFile?
    private var accentBufferStart: AVAudioPCMBuffer?
    
    init (accentedClickFile: URL) {
        
        var accentedFile: AVAudioFile?
        var enginePrep: AVAudioEngine?
        
        enum AccentClickError: Error {
            case engineFailed
        }

        do{
            let getAccentFile = try AVAudioFile(forReading: accentedClickFile)
            accentedFile = getAccentFile
        }catch{
            print("An error occurred")
        }
        
        audioFileAccentedClick = accentedFile!
        
        
        audioPlayerNode = AVAudioPlayerNode()
        audioEngine = AVAudioEngine()
        audioEngine.attach(self.audioPlayerNode)
        audioEngine.connect(audioPlayerNode, to: audioEngine.mainMixerNode, format: audioFileAccentedClick.processingFormat)

        do{
            let getEngine = AVAudioEngine()
           enginePrep = getEngine
            
        }catch AccentClickError.engineFailed{
            print("Engine Failed To Start")
        }catch{
            print("An error occurred")
        }
        engineStart = enginePrep
    }
    
    
    
    
    
    private func generateBuffer(bpm: Double) -> AVAudioPCMBuffer {
        

//        var accentBufferPrep: AVAudioFile?

        audioFileAccentedClick.framePosition = 0
        
        let beatLength = AVAudioFrameCount(audioFileAccentedClick.processingFormat.sampleRate * 60 / bpm)
        let bufferAccentedClick = AVAudioPCMBuffer(pcmFormat: audioFileAccentedClick.processingFormat, frameCapacity: beatLength)
        
//        do{
//            let getBufferAccent = try AVAudioFile(forReading: audioFileAccentedClick.read(into: bufferAccentedClick!))
//            accentBufferPrep = getBufferAccent
//
//        }catch{
//            print("An error occurred")
//        }
//
//        accentBufferStart = accentBufferPrep
        
        accentBufferStart = bufferAccentedClick
        
        
        bufferAccentedClick?.frameLength = beatLength
        
        let bufferBar = AVAudioPCMBuffer(pcmFormat: audioFileAccentedClick.processingFormat, frameCapacity: 4 * beatLength)
        bufferBar?.frameLength = 4 * beatLength
        
        // don't forget if we have two or more channels then we have to multiply memory pointee at channels count
        let accentedClickArray = Array(
            UnsafeBufferPointer(start: bufferAccentedClick?.floatChannelData?[0],
                                count:Int(audioFileAccentedClick.processingFormat.channelCount) * Int(beatLength))
        )
        
        
        var barArray = Array<Float>()
        // one time for first beat
//        barArray.append(contentsOf: accentedClickArray)
        // three times for regular clicks
        for _ in 1...4 {
            barArray.append(contentsOf: accentedClickArray)
        }
        
        bufferBar?.floatChannelData?.pointee.assign(from: barArray,
                                                    count: Int((audioFileAccentedClick.processingFormat.channelCount) * (bufferBar?.frameLength)!))
        return bufferBar!
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
