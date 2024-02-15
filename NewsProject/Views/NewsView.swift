//
//  NewsView.swift
//  NewsProject
//
//  Created by Gabriela Ehrenbrink on 15/02/2024.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject var data: SpaceAPI
    @Environment(\.openURL) var openURL
    private var textWidth = 300.0
    
    var body: some View {
        List {
            ForEach(data.news) { news in
                NewsArticle(title: news.title, imageUrl: news.imageUrl, siteName: news.newsSite, summary: news.summary)
                    .onTapGesture {
                        if let url = URL(string: news.url) {
                            openURL(url)
                        } else {
                            print("Invalid URL: \(news.url)")
                        }
                    }
            }
        }
        .refreshable {
            data.getData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        let spaceAPI = SpaceAPI()
        return NewsView().environmentObject(spaceAPI)
    }
}
