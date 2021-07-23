//
//  GalleryView.swift
//  Africa
//
//  Created by Zdenko Čepan on 20/07/2021.
//

import SwiftUI

struct GalleryView: View {
    // MARK: Properties
    
    // MARK: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Gallery")
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
