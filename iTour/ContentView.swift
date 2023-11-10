//
//  ContentView.swift
//  iTour
//
//  Created by Tal talspektor on 10/11/2023.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]

    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    Text(destination.name)
                        .font(.headline)

                    Text(destination.date.formatted(date: .long, time: .shortened))
                }
            }
            .navigationTitle("iTour")
            .toolbar {
                Button("Add Samples", action: addSamples)
            }
        }

    }

    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")

        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}

#Preview {
    ContentView()
}
