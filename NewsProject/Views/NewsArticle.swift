//
//  NewsArticle.swift
//  NewsProject
//
//  Created by Gabriela Ehrenbrink on 15/02/2024.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(Color(red: 7.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0))
                .italic()
                .bold()
            HStack(alignment:.center) {
                
                CachedAsyncImage(url: URL(string: imageUrl),
                                 transaction: Transaction(animation:
                                        .easeInOut)) { phase in if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .transition(.opacity)
                                        } else {
                                            Image(systemName: "exclamationmark.icloud.fill").foregroundColor(.red)
                                            
                                        }}
            }
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 8)
                
                Text(summary)
                    .lineLimit(6)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
                    .font(.body)
            }
            .padding()
        }
    }


struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Fake News", imageUrl: "no image", siteName: "Global News", summary: "Waiting for some real news.")
    }
}
