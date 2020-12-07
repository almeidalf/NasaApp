//
//  Alert.swift
//  NasaApp
//
//  Created by Felipe Almeida on 06/12/20.
//

import Foundation
import UIKit

class MessageAlertUtil {
    
    static func errorAlert(title: String, msg: String, view: UIViewController){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action -> Void in
            view.dismiss(animated: true, completion: nil)
        }))
        view.present(alert, animated: true, completion: nil)
    }
    
    static func errorAlertAndPop(title: String, msg: String, view: UIViewController){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action -> Void in
            view.dismiss(animated: true, completion: nil)
            view.navigationController?.popViewController(animated: true)
        }))
        view.present(alert, animated: true, completion: nil)
    }
    
}
