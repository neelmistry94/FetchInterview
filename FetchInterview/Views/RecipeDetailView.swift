//
//  RecipeDetailView.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/18/25.
//

import SwiftUI
import WebKit

struct RecipeDetailView: View {
    private let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    var body: some View {
        VStack {
            // Docs state that this uses URL Cache under the hood which works well this simple case
            AsyncImage(url: URL(string: recipe.photoURLLarge!)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
            }
            .frame(width: 200, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))

            HStack {
                Spacer()

                VStack {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                    Text("\(recipe.cuisine)")
                }

                Spacer()

                VStack {
                    Image(systemName: "video.fill")
                        .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50, alignment: .center)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    Link(destination: URL(string: recipe.youtubeURL!)!) {
                        Text("Show me the recipe >")
                    }
                }

                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))

            if let sourceURL = recipe.sourceURL {
                WebView(url: URL(string: sourceURL)!)
                    .edgesIgnoringSafeArea(.all)
            } else {
                Spacer()
                Text("There is no source data for this recipe at this time")
            }
        }
        .navigationTitle(recipe.name)
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

    RecipeDetailView(recipe: testRecipe1)
}
