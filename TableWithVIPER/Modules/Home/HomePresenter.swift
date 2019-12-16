//
//  HomePresenter.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        //Tenemos que decirle al interactor que queremos traer unos datos
        interactor?.interactorGetData()
        view?.startActivityIndicatorView()
    }
    
    func showDetailView(with data: Category.DatoURL) {
        wireFrame?.presentDetailView(from: view!, with: data)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataPresenter(receivedData: [Category.DatoURL]) {
        view?.stopActivityIndicatorView()
        view?.presenterPushDataView(receivedData: receivedData)
    }
}
