//
//  MainViewController.swift
//  NasaApp
//
//  Created by Felipe Almeida on 05/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    var radiusValue : CGFloat = 8

    @IBOutlet weak var apodButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI(){
        
        apodButton.layer.cornerRadius = radiusValue
    }

    @IBAction func apodAction(_ sender: Any) {
        let vc = ApodViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
