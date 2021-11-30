//
//  HomeViewControllerswift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 30/11/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    // MARK: - UI
    
    private(set) lazy var baseView: HomeView = {
        return HomeView()
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutBinds()
    }
}

// MARK: - Functions and Binds

private extension HomeViewController {
    func layoutBinds() {
        NSLayoutConstraint.activate([
            baseView.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        view.embed(subview: baseView, padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
}
