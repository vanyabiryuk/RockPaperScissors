//
//  ButtonView.swift
//  RockPaperScissors
//
//  Created by Vanüsha on 06.06.2022.
//

import SwiftUI

struct ButtonView: View {
    var title: String
    var action: () -> ()
    
    var body: some View {
        Button(title) {
            action()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .foregroundColor(.white)
        .font(.headline)
    }
}
