//
//  HomeViewControllerswift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 30/11/21.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    
    var imageName: String?
    
    // MARK: - UI
    
    private(set) lazy var baseView: HomeView = {
        return HomeView()
    }()
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel
    var spotlightModel: HomeModel.Data?
    
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
        baseView.header.name = viewModel.user
        viewModel.requestSpotlight()
        
        viewModel .didGetData = { [weak self] in
            guard let self = self,
                  let model = self.viewModel.model else {
                      return
                  }
            
            self.setupMainSlider(model)
            self.setupCashSection(model)
        }
    }
    
    func setupMainSlider(_ model: HomeModel.Data) {
        model.products.map({
            self.imageName = $0.imageURL
        })
    }
    
    func setupCashSection(_ model: HomeModel.Data) {
        baseView.cashSection.staticImage.cellImage.image = UIImage(named: "\(model.cash)")
    }
}
