//
//  ContentView.swift
//  H4X0R News
//
//  Created by Isaac Farr on 2/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager();
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink (destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("H4X0R NEWS")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                        
                }
            }
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
    }
}

