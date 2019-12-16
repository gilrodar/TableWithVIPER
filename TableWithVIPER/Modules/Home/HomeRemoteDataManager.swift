//
//  HomeRemoteDataManager.swift
//  TableWithVIPER
//
//  Created by Gil Rodarte on 13/12/19.
//  Copyright © 2019 Gil Rodarte. All rights reserved.
//

import Foundation
import Alamofire

class HomeRemoteDataManager: HomeRemoteDataManagerInputProtocol {
    
    // MARK: Properties
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var categories = [Category]()
    
    func externalGetData() {
        let baseURL = "https://cfeapps.com/wp-json/wp/v2/categories"
        Alamofire.request(baseURL).responseJSON { response in
            if let statusCode = response.response?.statusCode {
                if statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        self.categories = try decoder.decode([Category].self, from: response.data!)
                        
                        //Regresamos los datos al interactor
                        self.remoteRequestHandler?.remoteDataManagerCallBackData(with: self.categories)
                    } catch {
                        print("No se ha podido parsear el Json")
                    }
                }
            }
        }
    }
    
}
