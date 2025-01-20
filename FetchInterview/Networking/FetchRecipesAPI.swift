//
//  FetchRecipesAPI.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/15/25.
//

import Foundation
import SwiftUI

protocol FetchRecipesAPIProtocol {
    func fetchRecipes(path: String) async throws -> [Recipe]
}

struct FetchRecipesAPI {
    let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/"

    func fetchRecipes(path: String) async throws -> [Recipe] {

        // Setup the request
        let endpointURL = baseURL + path
        let url = URL(string: endpointURL)
        let request = URLRequest(url: url!) // Force unwrapping since in this case we can guarantee the URL

        // Make the request
        let (data, _) = try await URLSession.shared.data(for: request)

        let recipesResponse = try JSONDecoder().decode(RecipesResponse.self, from: data)

        return recipesResponse.recipes
    }
}
