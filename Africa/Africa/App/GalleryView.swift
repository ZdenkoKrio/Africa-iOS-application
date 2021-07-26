//
//  GalleryView.swift
//  Africa
//
//  Created by Zdenko Čepan on 20/07/2021.
//

import SwiftUI

struct GalleryView: View {
    // MARK: Properties
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Simple grid definition
    //var gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // Efficient grid definition
    //var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic grid layout
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridCount: Double = 3.0
    
    // MARK: Functions
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCount))
    }
    
    // MARK: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // MARK: Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK: Slider
                Slider(value: $gridCount, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridCount, perform: { value in
                        gridSwitch()
                    })
                
                // MARK: Grid
                LazyVGrid(columns: gridLayout) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                } // GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                    haptics.impactOccurred()
                })
            } // VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } // SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
            .previewDevice("iPhone 11 Pro")
    }
}
