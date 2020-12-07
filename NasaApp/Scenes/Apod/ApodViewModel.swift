//
//  ApodViewModel.swift
//  NasaApp
//
//  Created by Felipe Almeida on 05/12/20.
//

import Foundation
import Moya
import RxSwift
import UIKit

class ApodViewModel {
    let provider = MoyaProvider<Service>()
    let decoder = JSONDecoder()
    let apodValue : PublishSubject<ApodResponse> = PublishSubject<ApodResponse>()
    
    
}

extension ApodViewModel {
    
    func request(view: UIView){
        Singleton.sharedInstance.showActivityIndicatory(view: view)
        provider
            .request(.apod) { result in
                Singleton.sharedInstance.stopActivityIndicatory()
                switch result {
                case let .success(response):
                    do {
                        let jsonData = try self.decoder.decode(ApodResponse.self, from: response.data)
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
