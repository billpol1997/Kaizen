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
    }
    
    var content: some View {
        VStack {
            header
            events
        }
    }
    
    var header: some View {
        HStack(spacing: 2) {
            Image(self.viewModel.setupSportImage())
                .resizable()
                .frame(width: 15, height: 15)
            Text(self.viewModel.sport.name?.capitalized ?? "")
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
            isCollapsed.toggle()
            //TODO: more
        } label: {
            Image(isCollapsed ? "down-arrow" : "arrow-up")
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
