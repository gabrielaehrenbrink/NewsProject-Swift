//
//  APIClient.swift
//  NewsProject
//
//  Created by Gabriela Ehrenbrink on 15/02/2024.
//
// API endpoint: https://api.spaceflightnewsapi.net/v3/articles

import Foundation

struct SpaceData : Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

@MainActor class SpaceAPI : ObservableObject {
    @Published var news: [SpaceData] = []
    
    func getData() {
        guard let url = URL(string:"https://api.spaceflightnewsapi.net/v3/articles?_limit=8") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data else {
            let tempError = error!.localizedDescription
            DispatchQueue.main.async {
                self.news = [SpaceData(id: 0, title: tempError, url: "ERROR", imageUrl: "ERROR",newsSite: "Error", summary: "Refresh once you have internet", publishedAt: "Error")]
            }
            return
        }
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            DispatchQueue.main.async {
                print("Data loaded successfully. Articles: \(spaceData.count)")
                self.news = spaceData
            }
        }.resume()
    }
}
