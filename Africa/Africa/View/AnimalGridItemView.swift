//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Zdenko Čepan on 26/07/2021.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: Properties
    let animal: Animal
    
    // MARK: Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animlas.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
