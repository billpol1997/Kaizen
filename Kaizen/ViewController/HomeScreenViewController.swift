//
//  HomeScreenViewController.swift
//  Kaizen
//
//  Created by Bill on 9/2/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    
    private var viewModel = HomeScreenViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func setupTableViewUI() {
        tableView.backgroundColor = UIColor.clear
        tableView.estimatedRowHeight = 200
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.remembersLastFocusedIndexPath = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    private func configureTableView() {
        tableView.register(HostingTableViewCell<SportSectionView>.self, forCellReuseIdentifier: "SportSection")
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SportSection") as! HostingTableViewCell<SportSectionView>
//        cell.host(SportSectionView(viewModel: <#T##SportViewModel#>), parent: self)
//        return cell
//    }
    
    
    
    private func loadData() {
        Task { [weak self] in
            guard let self else { return }
            do {
               await viewModel.fetchSportList()
            }
        }
    }
    
}
