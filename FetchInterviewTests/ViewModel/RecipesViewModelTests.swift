//
//  RecipesViewModelTests.swift
//  FetchInterviewTests
//
//  Created by Neel Mistry on 1/20/25.
//

import Testing

struct mockFetchRecipesAPI: FetchRecipesAPIProtocol {
    let testRecipe1 = Recipe(cuisine: "Malaysian",
                             name: "Apam Balik",
                             photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                             photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                             sourceURL: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                             uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                             youtubeURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg")

    let testRecipe2 = Recipe(cuisine: "British",
                             name: "Apple & Blackberry Crumble",
                             photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                             photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                             sourceURL: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                             uuid: "599344f4-3c5c-4cca-b914-2210e3b3312f",
                             youtubeURL: "https://www.youtube.com/watch?v=4vhcOwVBDO4")

    func fetchRecipes(path: String) async throws -> [Recipe] {
        return [testRecipe1, testRecipe2]
    }
}

struct RecipesViewModelTests {

    @Test func testGetPath() async throws {
        // each call will progress to the next path
        let viewModel = RecipesViewModel()
        #expect(viewModel.getPath() == "recipes.json")
        #expect(viewModel.getPath() == "recipes-malformed.json")
        #expect(viewModel.getPath() == "recipes-empty.json")
        #expect(viewModel.getPath() == "recipes.json")
    }

    @Test func testGetUniqueCuiseinesList() async throws {
        let viewModel = RecipesViewModel()
    }
}
