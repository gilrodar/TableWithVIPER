//
//  HomeProtocols.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    
    func presenterPushDataView(receivedData: [Category.DatoURL])
    func startActivityIndicatorView()
    func stopActivityIndicatorView()
}

protocol HomeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func presentDetailView(from view: HomeViewProtocol, with data: Category.DatoURL)
}

protocol HomePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func showDetailView(with data: Category.DatoURL)
}

protocol HomeInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(receivedData: [Category.DatoURL])
}

protocol HomeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetData()
}

protocol HomeDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetData()
}

protocol HomeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerCallBackData(with categories: [Category])
}

protocol HomeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
