//
//  AsteroidsViewModel.swift
//  NasaApp
//
//  Created by Felipe Almeida on 06/12/20.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class AsteroidsViewModel {
    
    let provider = MoyaProvider<Service>()
    let decoder = JSONDecoder()
    let apodValue : PublishSubject<AsteroidsResponse> = PublishSubject<AsteroidsResponse>()
    
}


extension AsteroidsViewModel {
    
    func request(view: UIView){
        Singleton.sharedInstance.showActivityIndicatory(view: view)
        provider
            .request(.asteroids(RequestAsteroids.init(dataInicial: "2020-12-05", dataFinal: "2020-12-07"))) { result in
                Singleton.sharedInstance.stopActivityIndicatory()
                switch result {
                case let .success(response):
                    do {
                        let jsonData = try self.decoder.decode(AsteroidsResponse.self, from: response.data)
                        self.apodValue.onNext(jsonData)
                    } catch let err {
                        self.apodValue.onError(err)
                    }
                case let .failure(fail):
                    self.apodValue.onError(fail)
                }
            }
    }
}
