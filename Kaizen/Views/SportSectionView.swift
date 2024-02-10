//
//  SportSectionView.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import SwiftUI

struct SportSectionView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    var content: some View {
        VStack {
            header
            events
        }
    }
    
    var header: some View {
        HStack(spacing: 2) {
            Image("")
                .resizable()
                .frame(width: 15, height: 15)
            Text("")
                .foregroundColor(.white)
                .font(.footnote)
                .fontWeight(.bold)
            Spacer()
            expandButton
        }
        .padding(.horizontal, 8)
    }
    
    var expandButton: some View {
        Button {
            
        } label: {
            Image("")
                .resizable()
                .frame(width: 15, height: 15)
        }
    }
    
    var events: some View {
        ScrollView(.horizontal) {
            //TODO: events
        }
    }
}

#Preview {
    SportSectionView()
}
