//
//  AsteroidsViewController.swift
//  NasaApp
//
//  Created by Felipe Almeida on 06/12/20.
//

import UIKit

class AsteroidsViewController: UIViewController {
    
    let viewModel = AsteroidsViewModel()
    
    
    @IBOutlet weak var dataInicial: UIDatePicker!
    @IBOutlet weak var dataFinal: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel.request(view: view.self)
    }
    

}
