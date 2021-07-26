//
//  CenterModifier.swift
//  Africa
//
//  Created by Zdenko Čepan on 26/07/2021.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        } // HSTACK
    } // FUNC
}
