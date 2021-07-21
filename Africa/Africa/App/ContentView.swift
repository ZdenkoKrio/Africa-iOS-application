//
//  ContentView.swift
//  Africa
//
//  Created by Zdenko Čepan on 20/07/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // MARK: Properties
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        // MARK: Body
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { item in
                    NavigationLink(destination: AnimalDetailView(animal: item)) {
                        AnimalListItemView(animal: item)
                    } // LINK
                } // LOOP
            } // LIST
            .navigationBarTitle("Africa", displayMode: .large)
        } // NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
