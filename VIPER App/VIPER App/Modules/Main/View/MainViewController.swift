//  
//  MainViewController.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var output: MainViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    private func addAllSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupTableView() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseId)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(
                withIdentifier: MainTableViewCell.reuseId,
                for: indexPath
            ) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        let index = indexPath.row
        cell.configure(title: output?.item(at: index) ?? "")
        
        if let image = output?.cachedImage(at: index) {
            cell.setImage(image)
        } else {
            cell.setImage(nil)
            output?.fetchImage(at: indexPath.row)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        output?.didSelectItem(at: indexPath.row)
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {
    
    func setupInitialState() {
        setupTableView()
        addAllSubviews()
        setupConstraints()
    }
    
    func updateImage(_ image: UIImage?, at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        guard let cell = tableView.cellForRow(at: indexPath) as? MainTableViewCell else {
            return
        }
        cell.setImage(image)
    }
    
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UIViewController: TransitionHandler {
    func pushView(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Setup Constraints

extension MainViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView
                .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView
                .bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView
                .leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView
                .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
