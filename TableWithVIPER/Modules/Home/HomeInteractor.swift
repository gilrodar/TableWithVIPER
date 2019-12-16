//
//  HomeInteractor.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var categories: [Category.DatoURL] = []

    func interactorGetData() {
        //Tenemos que decirle a la capa de conexcion externa que queremos traer unos datos
        remoteDatamanager?.externalGetData()
    }
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallBackData(with categories: [Category]) {
        //Tenemos que mandar los datos al presenter
        print("Estoy obteniendo estos datos: \(categories)")
        for category in categories {
            let category = Category.DatoURL(href: category._links.links[0].href)
            self.categories.append(category)
        }
        print("Le paso al presenter: \(self.categories)")
        
        //Pasamos los datos al presenter
        presenter?.interactorPushDataPresenter(receivedData: self.categories)
    }
}
