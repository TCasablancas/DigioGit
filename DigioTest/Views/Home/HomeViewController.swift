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
        view.backgroundColor = .white
        layoutBinds()
        setupBinds()
    }
}

// MARK: - Functions and Binds

extension HomeViewController {
    func layoutBinds() {
        NSLayoutConstraint.activate([
        ])
        view.embed(subview: baseView, padding: .init(top: 80, left: 20, bottom: 20, right: 20))
    }
    
    func setupBinds() {
        baseView.header.name = viewModel.user
        viewModel.requestSpotlight()
        
        viewModel .didGetData = { [weak self] in
            guard let self = self,
                  let model = self.viewModel.model else {
                      return
                  }
            
//            self.viewModel.didPresentData(model)
            self.setupMainSlider(model)
        }
    }
    
    func setupMainSlider(_ model: HomeModel.Data) {
        print(model.products.map({ $0.name }))
    }
}
