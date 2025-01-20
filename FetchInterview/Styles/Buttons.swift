//
//  Buttons.swift
//  FetchInterview
//
//  Created by Neel Mistry on 1/18/25.
//

import SwiftUI

/// Pre-made style for FAB that will be used for filters. Can be customized to take in image so that it is a generic FAB
struct FilterFAB: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        Image(systemName: "line.3.horizontal.decrease")
            .font(.title.weight(.semibold))
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(radius: 4, x: 0, y: 4)
    }
}

extension ButtonStyle where Self == FilterFAB {
    static var filterFAB: Self {
        .init()
    }
}

#Preview {
    Button("") {}
        .buttonStyle(.filterFAB)
}

