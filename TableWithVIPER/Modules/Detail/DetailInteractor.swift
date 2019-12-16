//
//  DetailInteractor.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 15/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?

}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
