//
//  DetailView.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 15/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController {

    // MARK: Properties
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var presenter: DetailPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

extension DetailView: DetailViewProtocol {
    func showDataInLabel(data: Category.DatoURL) {
        label.text = data.href
    }
}
