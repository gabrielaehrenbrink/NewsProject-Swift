//
//  ContentView.swift
//  NewsProject
//
//  Created by Gabriela Ehrenbrink on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                NewsView()
                    .opacity(opac)
            }
            .navigationTitle("World News")
            .environmentObject(data)
            .onAppear {
                data.getData()
                
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider { // Fixed typo in struct name
    static var previews: some View {
        ContentView()
    }
}
