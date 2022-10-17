//
//  SongViewModel.swift
//  TestCodeJPMC
//
//  Created by Consultant on 10/17/22.
//

import Foundation
import AVKit

class SongViewModel: NSObject, ObservableObject {
    var player: AVAudioPlayer!
    @Published private(set) var isPlaying: Bool = false
    
    func initPlayer(_ audio: String) {
        guard let sound = Bundle.main.path(forResource: audio, ofType: "mp3") else { return  }
       
        do {
            self.player = try AVAudioPlayer(contentsOf:  URL(fileURLWithPath: sound))
            self.player.delegate = self
        }catch {
            print(error)
        }
        
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.stop()
    }
    
    func playPauseButtonPressed() {
        if let player = player, player.isPlaying {
            isPlaying = false
            pause()
        }else {
            isPlaying = true
            play()
        }
    }
    
}

extension SongViewModel: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard flag else { return }
        self.isPlaying = false
    }
}

