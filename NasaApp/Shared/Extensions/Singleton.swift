//
//  Singleton.swift
//  NasaApp
//
//  Created by Felipe Almeida on 06/12/20.
//

import Foundation
import UIKit

class Singleton{
    
    static let sharedInstance = Singleton()
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func showActivityIndicatory(view: UIView) {
        actInd.center = view.center
        actInd.hidesWhenStopped = true
        actInd.style = UIActivityIndicatorView.Style.large
        actInd.color = UIColor.black
        view.addSubview(actInd)
        actInd.startAnimating()
        UIApplication.shared.beginReceivingRemoteControlEvents()
    }
    
    func stopActivityIndicatory(){
        actInd.stopAnimating()
        UIApplication.shared.endReceivingRemoteControlEvents()
    }
}
