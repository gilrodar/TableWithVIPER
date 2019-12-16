//
//  DetailPresenter.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 15/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var datoURL: Category.DatoURL?
    
}

extension DetailPresenter: DetailPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        if let datoURL = datoURL {
            view?.showDataInLabel(data: datoURL)
        }
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
