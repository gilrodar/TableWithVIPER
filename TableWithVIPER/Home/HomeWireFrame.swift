//
//  HomeWireFrame.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
//    class func createHomeModule() -> UIViewController {
//        let view = HomeView()
//        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
//        let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
//        let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
//        let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
//        let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
//
//        view.presenter = presenter
//        presenter.view = view
//        presenter.wireFrame = wireFrame
//        presenter.interactor = interactor
//        interactor.presenter = presenter
//        interactor.localDatamanager = localDataManager
//        interactor.remoteDatamanager = remoteDataManager
//        remoteDataManager.remoteRequestHandler = interactor
//
//        return view
//    }
    
    class func createHomeModule() -> UIViewController {
        let navigationController = UINavigationController(rootViewController: HomeView())
        if let view = navigationController.children.first as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol & HomeRemoteDataManagerOutputProtocol = HomeInteractor()
            let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
            let remoteDataManager: HomeRemoteDataManagerInputProtocol = HomeRemoteDataManager()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navigationController
        }
        return UIViewController()
    }
    
}
