//
//  HomeView.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UITableViewController {

    // MARK: Properties
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.style = .large
        activityIndicatorView.color = .red
        return activityIndicatorView
    }()
    
    var presenter: HomePresenterProtocol?
    var categories: [Category.DatoURL] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = categories[indexPath.row].href
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailView(with: Category.DatoURL(href: categories[indexPath.row].href))
    }
    
    private func setupViews() {
        view.addSubview(activityIndicatorView)
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
    
}

extension HomeView: HomeViewProtocol {
    
    func presenterPushDataView(receivedData: [Category.DatoURL]) {
        categories = receivedData
        tableView.reloadData()
    }
    
    func startActivityIndicatorView() {
        activityIndicatorView.startAnimating()
    }
    
    func stopActivityIndicatorView() {
        activityIndicatorView.stopAnimating()
    }
    
}
