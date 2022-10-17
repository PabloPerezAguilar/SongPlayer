//
//  Song.swift
//  TestCodeJPMC
//
//  Created by Consultant on 10/17/22.
//

import Foundation

struct Song: Hashable {
    let name: String
    let image: String
    let audio: String
}

extension Song {
    static var dummyData: Song{
        .init(name: "Dummy", image: "album_2", audio: "sample-6s")
    }
}
