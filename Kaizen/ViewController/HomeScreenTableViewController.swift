//
//  HomeScreenTableViewController.swift
//  Kaizen
//
//  Created by Bill on 10/2/24.
//

import UIKit

class HomeScreenTableViewController: UITableViewController {
    
    private var viewModel = HomeScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewUI()
        loadData()
    }
    
    private func loadData() {
        Task { [weak self] in
            guard let self else { return }
            do {
               await viewModel.fetchSportList()
               configureTableView()
               tableView.reloadData()
            }
        }
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

    
    // MARK: - Table view data source
    
    private func configureTableView() {
        tableView.register(HostingTableViewCell<SportSectionView>.self, forCellReuseIdentifier: "SportSection")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection  section: Int) -> Int {
        guard let count = viewModel.list?.list?.count else { return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportSection") as! HostingTableViewCell<SportSectionView>
        guard let cellData = viewModel.list?.list?[indexPath.row] else { return cell}
        cell.set(rootView: SportSectionView(viewModel: SportViewModel(sport: cellData)), parentController: self)
        return cell
    }
}
