//
//  RecipesViewModel.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/19/25.
//

import Foundation

final class RecipesViewModel: ObservableObject {
    private let fetchRecipesAPI: FetchRecipesAPI
    private var apiPathIndexer: Int

    @Published private var recipes: [Recipe]

    @Published var emptyAlert = false
    @Published var malformedAlert = false

    init() {
        fetchRecipesAPI = FetchRecipesAPI()
        recipes = []
        apiPathIndexer = 0
    }
    
    func fetchRecipes() async {
        do {
            let recipesResponse = try await fetchRecipesAPI.fetchRecipes(path: getPath())
            if recipesResponse.isEmpty {
                DispatchQueue.main.async {
                    self.emptyAlert = true
                }
            } else {
                DispatchQueue.main.async {
                    self.emptyAlert = false
                }
            }
            DispatchQueue.main.async {
                self.recipes = recipesResponse
                self.malformedAlert = false
            }

        } catch {
            DispatchQueue.main.async {
                self.recipes = []
                self.malformedAlert = true
            }
            print(error.localizedDescription)
        }
    }

    func getPath() -> String {
        var path = ""

        switch apiPathIndexer {
        case 0:
            path = "recipes.json"
            apiPathIndexer += 1
        case 1:
            path = "recipes-malformed.json"
            apiPathIndexer += 1
        case 2:
            path = "recipes-empty.json"
            apiPathIndexer = 0
        default:
            path = "recipes.json"
            apiPathIndexer = 0
        }

        return path
    }

    /// Getters
    func getRecipes() -> [Recipe] {
        return recipes
    }

    /// Can be used for filtering
    func getUniqueCuisinesList() -> [String] {
        return Array(Set(recipes.map({$0.cuisine})))
    }
}
