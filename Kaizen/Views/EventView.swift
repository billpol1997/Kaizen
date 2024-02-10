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
            .background(.clear)
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
            Text(String(format: "%d:%d:%d", viewModel.hours, viewModel.minutes, viewModel.seconds))
                .foregroundColor(.white.opacity(0.8))
                .font(.footnote)
        }
        .border(.white.opacity(0.9))
        .cornerRadius(4)
    }
    
    var favorite: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(isFavorite ? "star_full" : "star")
                .resizable()
                .frame(width: 15, height: 15)
                .if(!isFavorite, transform: { image in
                    image
                        .foregroundColor(.white.opacity(0.8))
                })
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
