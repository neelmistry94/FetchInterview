//
//  AllRecipesView.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/16/25.
//

import SwiftData
import SwiftUI

struct AllRecipesView: View {
    @StateObject private var viewModel = RecipesViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List(viewModel.getRecipes()) { recipe in
                    NavigationLink {
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        RecipeRowView(recipe: recipe)
                    }
                }
                .refreshable {
                    Task {
                        await viewModel.fetchRecipes()
                    }
                }
                .overlay(
                    Group {
                        if viewModel.getRecipes().isEmpty {
                            Text("Oops, looks like there's no data...")
                        }
                    }
                )

                // TODO: Create a Filter by cuisine if time permits
//                Button("") {
//                    Picker("Cuisine", selection: $selectedCuisine) {
//                        ForEach(0..<cuisinesUniqueList.count, content: { index in
//                            Text(cuisinesUniqueList[index])
//                        })
//                    }
//                }
//                .buttonStyle(.filterFAB)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchRecipes()
            }
        }
        .navigationTitle("World Recipes")
        .alert("There was an issue retrieving new recipes, please try again", isPresented: $viewModel.malformedAlert) {
            Button("OK", role: .cancel) { }
        }
        .alert("There were no recipes found, please try again", isPresented: $viewModel.emptyAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
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

    AllRecipesView()
}
