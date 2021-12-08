//
//  HomeViewControllerswift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 30/11/21.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - UI
    
    private(set) lazy var baseView: HomeView = {
        return HomeView()
    }()
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel
    var products: [Products]?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = baseView
        setupBinds()
    }
}

// MARK: - Functions and Binds

extension HomeViewController {
    func setupBinds() {
        self.baseView.header.userName.text = viewModel.user
        viewModel.requestMainData()
        viewModel.didGetData = { [weak self] in
            guard
                let self = self,
                let model = self.viewModel.model else {
                    return
                }
            self.products = model.products
            
            self.viewModel.setupSpotlight(model.spotlight)
            self.viewModel.setupCashSection(model, imageView: self.baseView.cashSection.staticImage.cellImage)
            self.baseView.mainSection.model = [model]
            
            self.baseView.mainSection.viewController = self
            self.baseView.productsSection.viewController = self
            
            model.products.map {
                self.baseView.mainSection.imageURL = $0.imageURL
                self.baseView.productsSection.imageURL = $0.imageURL
                self.baseView.productsSection.productDescription = $0.description
                self.baseView.productsSection.productTitle = $0.name
                
                self.baseView.productsSection.products = model.products
            }
        }
    }
}
