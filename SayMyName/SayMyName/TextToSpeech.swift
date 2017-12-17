//
//  TextToSpeech.swift
//  SayMyName
//
//  Created by user131309 on 12/16/17.
//  Copyright © 2017 Patricia Toles. All rights reserved.
//

import UIKit
import AVFoundation


class TextToSpeech: NSObject {
    
    class func SayText(input : String) {
        let synth : AVSpeechSynthesizer = AVSpeechSynthesizer()
        let utterance : AVSpeechUtterance = AVSpeechUtterance(string: input)
        synth.speak(utterance)

    }

}
