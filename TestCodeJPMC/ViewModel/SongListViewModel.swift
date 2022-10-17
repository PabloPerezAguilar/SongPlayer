//
//  SongList.swift
//  TestCodeJPMC
//
//  Created by Consultant on 10/17/22.
//

import Foundation


class SongListViewModel: ObservableObject {
    @Published private(set) var songs: [Song] = []
    
    func getSongs(){
        songs = mockSongData()
    }
    
    func mockSongData() -> [Song] {
        var songs: [Song] = []
        
        let song1 = Song(name: "Song 1", image: "album", audio: "sample-3s")
        songs.append(song1)
        
        let song2 = Song(name: "Song 2", image: "album_2", audio: "sample-6s")
        songs.append(song2)
        
        let song3 = Song(name: "Song 3", image: "album_3", audio: "sample-9s")
        songs.append(song3)
        
        return songs
    }
    
    
}
