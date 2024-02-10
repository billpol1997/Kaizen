//
//  SportSectionView.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import SwiftUI

struct SportSectionView: View {
    @ObservedObject var viewModel: SportViewModel
    @State var isCollapsed: Bool = false
    
    init(viewModel: SportViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
            .background(.black.opacity(0.9))
    }
    
    @ViewBuilder
    var content: some View {
        VStack {
            header
            if !isCollapsed {
                events
            }
        }
    }
    
    var header: some View {
        HStack(spacing: 2) {
            Image(self.viewModel.setupSportImage())
                .resizable()
                .frame(width: 15, height: 15)
            Text(self.viewModel.sport.name?.capitalized ?? "")
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.bold)
            Spacer()
            expandButton
        }
        .padding(8)
        .background(Color.orange)
    }
    
    var expandButton: some View {
        Button {
            isCollapsed.toggle()
        } label: {
            Image(isCollapsed ? "down-arrow" : "arrow-up")
                .resizable()
                .frame(width: 15, height: 15)
        }
    }
    
    var events: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(self.viewModel.events, id: \.id) { event in
                    EventView(viewModel: EventViewModel(event: event)) {
                        self.viewModel.handleFavorites()
                    }
                }
                .padding(.leading, 8)
                .padding(.top, 16)
                .padding(.bottom, 32)
            }
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
