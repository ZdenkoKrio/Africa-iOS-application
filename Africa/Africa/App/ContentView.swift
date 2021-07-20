//
//  ContentView.swift
//  Africa
//
//  Created by Zdenko Čepan on 20/07/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    
    // MARK: Body
    var body: some View {
        Text("Content")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
