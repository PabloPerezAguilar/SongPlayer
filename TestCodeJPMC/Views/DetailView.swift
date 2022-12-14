//
//  DetailView.swift
//  TestCodeJPMC
//
//  Created by Consultant on 10/17/22.
//

import SwiftUI
import AVKit

struct DetailView: View {
    
    let song: Song
    @StateObject var viewModel = SongViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Image(song.image)
                    .resizable()
                    .padding()
                    .frame(width: 350, height: 350)
                
                
                Button {
                    viewModel.playPauseButtonPressed()
                } label: {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                        .padding()
                        .background {
                            Circle()
                                .fill(.white)
                                .shadow(radius: 10)
                        }
                }
            }
            
            Text(song.name)
                .font(.title)

        }
        .onAppear {
            viewModel.initPlayer(song.audio)
        }
        .onDisappear {
            viewModel.pause()
        }
    }
    

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(song: Song.dummyData)
    }
}
