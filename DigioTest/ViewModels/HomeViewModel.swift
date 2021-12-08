//
//  HomeViewModel.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import Kingfisher

protocol HomeViewModelProtocol {
    var worker: MainWorker? { get }
    var model: HomeModel.Data? { get set }
    var didGetData: (() -> Void)? { get set }
    var user: String? { get set }
}

class HomeViewModel: HomeViewModelProtocol {
    var worker: MainWorker?
    var model: HomeModel.Data?
    
    var didGetData: (() -> Void)?
    var user: String?
    
    init(worker: MainWorker = MainWorker()) {
        self.worker = worker
        user = "Olá, Thiago"
    }
    
    func requestMainData() {
        self.worker?.getData { [weak self] (response) in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                switch response {
                case .success(let model):
                    self.model = model
                    self.didGetData?()
                case .noConnection(let description):
                    print("Server error timeOut: \(description) \n")
                case .serverError(let error):
                    let errorData = "\(error.statusCode), -, \(error.msgError)"
                    print("Server error: \(errorData) \n")
                    break
                case .timeOut(let description):
                    print("Server error noConnection: \(description) \n")
                }
            }
        }
    }
    
    func setupSpotlight(_ model: [Spotlight]) {
        model.map{ $0.bannerURL }
    }
    
    func setupCashSection(_ model: HomeModel.Data, imageView: UIImageView) {
        setupImage(model, image: model.cash.bannerURL, imageView: imageView)
    }
    
    func setupProductsSection(_ model: HomeModel.Data, imageView: UIImageView, setupView: Void) {
        model.products.map {
            setupImage(model, image: $0.imageURL, imageView: imageView)
        }
    }
    
    private func setupImage(_ model: HomeModel.Data, image: String, imageView: UIImageView) {
        if let url = URL(string: image) {
            imageView.kf.indicatorType = .activity
            imageView.kf.setImage(with: url)
        } else {
            imageView.image = UIImage(named: image)
        }
    }
}
