//
//  HomeView.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter?.viewDidLoad()
         
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "HomeViewController"
        view.addSubview(lb)
        NSLayoutConstraint.activate([
            lb.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lb.centerYAnchor.constraint(equalTo: view.centerYAnchor)   
        ])
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
