//
//  EventView.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import SwiftUI

struct EventView: View {
    @ObservedObject var viewModel: EventViewModel
    @State var isFavorite: Bool = false
    
    init(viewModel: EventViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
       content
    }
    
    var content: some View {
        VStack(alignment: .center) {
            timer
            favorite
            match
        }
    }
    
    var timer: some View {
        HStack {
            Text(" ")
                .foregroundColor(.gray)
                .font(.footnote)
        }
        .border(.gray)
        .cornerRadius(4)
    }
    
    var favorite: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(isFavorite ? "star_full" : "star")
                .resizable()
                .frame(width: 15, height: 15)
        }
    }
    
    var match: some View {
        VStack {
            Text(viewModel.event.name ?? "")
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}
