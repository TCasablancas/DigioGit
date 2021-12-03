//
//  HomeViewModel.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation

protocol HomeViewModelProtocol {
    var worker: MainWorker? { get }
    var model: HomeModel.Data? { get set }
    var didGetData: (() -> Void)? { get set }
}

class HomeViewModel: HomeViewModelProtocol {
    var worker: MainWorker?
    var model: HomeModel.Data?
    
    var didGetData: (() -> Void)?
    var user: String = "Thiago"
    
    init(worker: MainWorker = MainWorker()) {
        self.worker = worker
    }
    
    func requestSpotlight() {
        self.worker?.getData { [weak self] (response) in
            guard let self = self else {
                return
            }
            
            DispatchQueue.main.async {
                switch response {
                case .success(let model):
                    self.model = model
                    self.didGetData?()
                case .noConnection(let error):
                    print(error)
                case .serverError(let error):
                    print(error)
                case .timeOut(let error):
                    print(error)
                }
            }
        }
    }
    
    func didPresentData(_ model: HomeModel.Data) {
        self.model = model
        model.spotlight.map {
            print( $0.name )
        }
        
        model.products.map({
            print( $0.description )
        })
    }
}
