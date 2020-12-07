//
//  ApodViewController.swift
//  NasaApp
//
//  Created by Felipe Almeida on 05/12/20.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class ApodViewController: UIViewController {
    
    var disposeBag = DisposeBag()
    let viewModel = ApodViewModel()
    
    @IBOutlet weak var apodImageView: UIImageView!
    @IBOutlet weak var apodTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        requestData()
        populandoDados()
    }
    
    private func setupUI(){
        
    }
    
    private func requestData(){
        viewModel.request(view: view.self)
    }
    
    private func populandoDados(){
        viewModel
            .apodValue
            .asObserver()
            .subscribe(onNext: { value in
                self.apodTextView.text = value.explanation
                self.apodImageView.af.setImage(withURL: URL(string: value.url) ?? URL.init(fileURLWithPath: ""))
            }, onError: { err in
                MessageAlertUtil.errorAlertAndPop(title: "Atenção", msg: err.localizedDescription, view: self)
            }).disposed(by: disposeBag)
    }
}
