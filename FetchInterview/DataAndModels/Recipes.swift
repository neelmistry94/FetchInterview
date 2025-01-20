//
//  Recipes.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/15/25.
//

// Sample JSON
//{
//    "cuisine": "Malaysian",
//    "name": "Apam Balik",
//    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
//    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
//    "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
//    "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
//    "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
//}

import Foundation

struct RecipesResponse: Codable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Hashable, Codable {
    var id = UUID()

    let cuisine: String
    let name: String
    let photoURLLarge: String?
    let photoURLSmall: String?
    let sourceURL: String?
    let uuid: String
    let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case cuisine = "cuisine"
        case name = "name"
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case uuid = "uuid"
        case youtubeURL = "youtube_url"
    }
}
