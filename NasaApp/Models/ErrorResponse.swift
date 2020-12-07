//
//  ErrorResponse.swift
//  NasaApp
//
//  Created by Felipe Almeida on 06/12/20.
//

import Foundation

struct ErrorResponse {
    let error : String?
    let message: String?
    
    init(_ err: String, message: String){
        self.error = err
        self.message = message
    }
}
