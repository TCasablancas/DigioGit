//
//  ProductViewController.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 30/11/21.
//

import Foundation
import UIKit

final class ProductViewController: UIViewController {
    // MARK: - Properties
    
    var imageURL: String
    var productTitle: String
    var productDescription: String
    
    // MARK: - UI
    
    private(set) lazy var baseView: ProductView = {
        return ProductView()
    }()
    
    // MARK: - Init
    
    init(imageURL: String, productTitle: String, productDescription: String) {
        self.imageURL = imageURL
        self.productTitle = productTitle
        self.productDescription = productDescription
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutBinds()
        setupProductData()
        view.backgroundColor = .white
    }
    
    func setupProductData() {
        self.baseView.productImage.image = UIImage(named: imageURL)
        self.baseView.productTitle.text = self.productTitle
        self.baseView.productDescription.text = self.productDescription
        
        self.baseView.dismissButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ProductViewController {
    private func layoutBinds() {
        view.embed(subview: baseView)
    }
}
