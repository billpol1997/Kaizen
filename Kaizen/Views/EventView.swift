//
//  EventView.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import SwiftUI
import Combine

struct EventView: View {
    @ObservedObject var viewModel: EventViewModel
    @State var isFavorite: Bool = false
    let countdown = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var action: ((String, Bool)) -> ()
    
    init(viewModel: EventViewModel, action: @escaping ((String, Bool)) -> ()) {
        self.viewModel = viewModel
        self.action = action
    }
    
    var body: some View {
       content
            .background(.clear)
            .onAppear {
                self.isFavorite = self.viewModel.event.isFavorite
                self.viewModel.displayTime()
            }
            .onReceive(countdown) { _ in
                if self.viewModel.event.startTime ?? 0 > 0 {
                    self.viewModel.event.startTime =  (self.viewModel.event.startTime ?? 0) - 1
                    self.viewModel.displayTime()
                }
            }
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
                .fontWeight(.semibold)
        }
        .padding(4)
        .border(.white.opacity(0.9))
        .cornerRadius(2)
    }
    
    var favorite: some View {
        Button {
            isFavorite.toggle()
            action((viewModel.event.id ?? "", isFavorite))
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
                .foregroundColor(.white.opacity(0.9))
                .font(.footnote)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}
