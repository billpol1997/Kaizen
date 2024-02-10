//
//  EventView.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    var content: some View {
        VStack {
            timer
            favorite
            match
        }
    }
    
    var timer: some View {
        HStack {
            Text("")
                .foregroundColor(.gray)
                .font(.footnote)
        }
        .border(.gray)
        .cornerRadius(4)
    }
    
    var favorite: some View {
        Image("")
            .resizable()
            .frame(width: 15, height: 15)
    }
    
    var match: some View {
        VStack {
            Text("")
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}

#Preview {
    EventView()
}
