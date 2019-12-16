//
//  DetailWireFrame.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 15/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    static func createDetailModule(with data: Category.DatoURL) -> UIViewController {
        let view = DetailView()
        let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
        let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
        let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
        let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        presenter.datoURL = data
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
        
        return view
    }
}
