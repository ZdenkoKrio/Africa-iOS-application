//
//  InsetFactView.swift
//  Africa
//
//  Created by Zdenko Čepan on 21/07/2021.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: Properties
    let animal: Animal
    
    // MARK: Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                } // LOOP
            } // TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } // GROUP
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
