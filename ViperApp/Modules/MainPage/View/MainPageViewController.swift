//
//  MainViewController.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 12.11.2023.
//

import UIKit

protocol MainPageViewInput: AnyObject {
    func showIndicator()
    func hideIndicator()
    func reloadTable()
}

protocol MainPageViewOutput {
    var dataSouce: [CharacterModel] { get set }
    func obtainCharacters()
}

class MainPageViewController: UIViewController {
    
    var presenter: MainPageViewOutput!
    private let refreshControl = UIRefreshControl()
    private let activityIndicator = UIActivityIndicatorView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 0
        tableView.addSubview(refreshControl)
        tableView.addSubview(activityIndicator)
        tableView.register(MainPageTableViewCell.self
                           , forCellReuseIdentifier: MainPageTableViewCell.identifire)
        return tableView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: Setup views
    private func setupViews() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    // MARK: Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func refreshOption(_ sender: Any) {
        presenter.obtainCharacters()
    }
    
}
// MARK: DataSource + Delegate

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPageTableViewCell.identifire, for: indexPath) as? MainPageTableViewCell else { return UITableViewCell() }
        cell.textLabel?.text = "SOME"
        return cell
    }
}

extension MainPageViewController: MainPageViewInput {
    func showIndicator() {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
    }
    
    func hideIndicator() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func reloadTable() {
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}
