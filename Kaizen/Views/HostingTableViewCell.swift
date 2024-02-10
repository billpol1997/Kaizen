//
//  HostingTableViewCell.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import Foundation
import SwiftUI

class HostingTableViewCell<Content: View>: UITableViewCell {
    
    private var controller = UIHostingController<Content?>(rootView: nil)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        controller.view.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(rootView: Content, parentController: UIViewController) {
            self.controller.rootView = rootView
            self.controller.view.invalidateIntrinsicContentSize()

            let requiresControllerMove = controller.parent != parentController
            if requiresControllerMove {
                parentController.addChild(controller)
            }

            if !self.contentView.subviews.contains(controller.view) {
                self.contentView.addSubview(controller.view)
                controller.view.translatesAutoresizingMaskIntoConstraints = false
                controller.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
                controller.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
                controller.view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
                controller.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
            }

            if requiresControllerMove {
                controller.didMove(toParent: parentController)
            }
        }}
