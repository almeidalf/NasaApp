//
//  MainViewController.swift
//  NasaApp
//
//  Created by Felipe Almeida on 05/12/20.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    //MARK: - VARIAVEIS RX
    var disposeBag = DisposeBag()
    
    var radiusValue : CGFloat = 8
    
    @IBOutlet weak var apodButton: UIButton!
    @IBOutlet weak var asteroidsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindsButton()
    }
    
    private func setupUI(){
        apodButton.layer.cornerRadius = radiusValue
        asteroidsButton.layer.cornerRadius = radiusValue
    }
    
    private func setupBindsButton(){
        
        apodButton
            .rx
            .tap
            .subscribe(onNext: { [weak self] _ in
                let vc = ApodViewController()
                self?.navigationController?.pushViewController(vc, animated: true)
            }).disposed(by: disposeBag)
        
        asteroidsButton
            .rx
            .tap
            .subscribe(onNext: { _ in
                MessageAlertUtil.errorAlert(title: "Em construção!", msg: "Fique calmo, ainda estamos trabalhando aqui. \n Logo tudo estará pronto para você", view: self)
            }).disposed(by: disposeBag)
    }
}
