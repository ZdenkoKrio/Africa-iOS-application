//
//  HeadingView.swift
//  Africa
//
//  Created by Zdenko Čepan on 21/07/2021.
//

import SwiftUI

struct HeadingView: View {
    // MARK: Properties
    var headingImage: String
    var headingText: String
    
    // MARK: Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        } // HSTACK
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled",
                    headingText: "Wildnerness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
