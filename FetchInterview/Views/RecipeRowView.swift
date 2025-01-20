//
//  RecipeRowView.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/18/25.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    var body: some View {
        HStack {
            // Docs state that this uses URL Cache under the hood which works well this simple case
            AsyncImage(url: URL(string: recipe.photoURLSmall!)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
            }
            .frame(width: 50, height: 50)

            Text(recipe.name)

            Spacer()
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

    RecipeRowView(recipe: testRecipe1)
}
