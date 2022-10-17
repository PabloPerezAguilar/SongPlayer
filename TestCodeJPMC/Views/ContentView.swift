//
//  ContentView.swift
//  TestCodeJPMC
//
//  Created by Consultant on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = SongListViewModel()
    let cols: [GridItem] = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: cols, spacing: 10) {
                    ForEach(viewModel.songs, id: \.self) { item in
                        NavigationLink(destination: DetailView(song: item)) {
                                VStack {
                                    Image(item.image)
                                        .resizable()
                                        .frame(height: 150)
                                        
                                    Text(item.name)
                            }
                           
                        }
                        .padding(.horizontal)
                       
                    }
                }
            }
            .navigationTitle("Songs list")
        }.onAppear(perform: viewModel.getSongs)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
