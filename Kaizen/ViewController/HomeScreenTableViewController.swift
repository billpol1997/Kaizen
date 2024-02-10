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
        setupNav()
        setupTableViewUI()
        loadData()
    }
    
    //MARK: load data
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
    
    //MARK: Navigation bar
    private func setupNav() {
        let logo = UIImage(named: "logo")
        let logoView = UIImageView(image: logo)
        logoView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = logoView
        setupNavButtons()
    }
    
    private func setupNavButtons() {
        
        let settingsButton = UIButton(type: .custom)
        settingsButton.setImage(UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal), for: .normal)
        settingsButton.contentMode = .scaleAspectFit
        settingsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        let settingsBarButton = UIBarButtonItem(customView: settingsButton)
        
        
        let profileButton = UIButton(type: .custom)
        profileButton.setImage(UIImage(named: "user")?.withRenderingMode(.alwaysOriginal), for: .normal)
        profileButton.contentMode = .scaleAspectFit
        profileButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        let profileBarButton = UIBarButtonItem(customView: profileButton)
        
        
        navigationItem.setRightBarButton(settingsBarButton, animated: false)
        navigationItem.setLeftBarButton(profileBarButton, animated: false)
    }
    
    @objc private func settingsButtonTapped() {
        // Handle settings button tap
        print("Settings button tapped")
    }
    
    @objc private func profileButtonTapped() {
        // Handle profile button tap
        print("Profile button tapped")
    }
    
    //MARK: Table view
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
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
