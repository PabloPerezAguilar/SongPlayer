//
//  SongViewModel.swift
//  TestCodeJPMC
//
//  Created by Consultant on 10/17/22.
//

import Foundation
import AVKit


protocol SongViewModel {
    func initPlayer(_ audio: String)
    func play()
    func pause()
    func buttonPressed()
}

class SongViewModelImp: ObservableObject, SongViewModel {
    var player: AVAudioPlayer!
    @Published private(set) var isPlaying: Bool = false
    
    func initPlayer(_ audio: String) {
        let sound = Bundle.main.path(forResource: audio, ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.stop()
    }
    
    func buttonPressed() {
        if let player = player, player.isPlaying {
            isPlaying = false
            pause()
        }else {
            isPlaying = true
            play()
        }
    }
    
    
    
}
