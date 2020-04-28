//
//  SoundManager.swift
//  Match App
//
//  Created by Saman Sandhu on 2019-12-26.
//  Copyright © 2019 Saman Sandhu. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
    // Static methods are called type methods in swift
    static func playSound(_ effect: SoundEffect) {
        
        var soundFilename = ""
        
        // Determine which sound we want to play and set the appropriate filename
        switch effect {
            
        case .flip:
            soundFilename = "cardflip"
            
        case .shuffle:
            soundFilename = "shuffle"
            
        case .match:
            soundFilename = "dingcorrect"
            
        case .nomatch:
            soundFilename = "dingwrong"
            
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
            
        } catch {
            
            // Couldn't create audio player object, log the error
            print("Couldn't create the audio player object for the sound file \(soundFilename)")
            
        }
    
    }
        
}
