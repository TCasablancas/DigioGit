//
//  ProductsView.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 04/12/21.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

final class ProductsView: UIView {
    // MARK: - Properties
    
    var products = [Products]()
    
    var viewController: UIViewController?
    var imageURL: String?
    var productTitle: String?
    var productDescription: String?
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sectionTitle, collectionView])
        stackView.axis = .vertical
        return stackView
    }()
    lazy var sectionTitle: SectionTitle = {
        return SectionTitle()
    }()
    lazy var scrollViewStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return stackView
    }()
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 120),
                                          collectionViewLayout: flowLayout())
        collection.register(CellImageContainer.self, forCellWithReuseIdentifier: reuseIdentifier)
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.layer.cornerRadius = 8
        collection.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return collection
    }()
    
    let data = ["https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
                "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png",
                "https://s3-sa-east-1.amazonaws.com/digio-exame/level_up_icon.png"]
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CellImageContainer
        let item = data[indexPath.row]
        
        cell.setupCell(item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.showProduct()
    }
    
    @objc func showProduct() {
        navigateToView(image: self.imageURL ?? "", name: self.productTitle ?? "", description: self.productDescription ?? "")
    }
    
    private func navigateToView(image: String, name: String, description: String) {
        let productView = ProductViewController(imageURL: image, productTitle: name, productDescription: description)
        self.viewController?.navigationController?.pushViewController(productView, animated: true)
    }
}

extension ProductsView {
    private func layoutBinds() {
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 180),
            sectionTitle.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        embed(subview: stackView)
    }
    
    private func flowLayout() -> UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10)
        flow.itemSize = CGSize(width: 120, height: 120.0)
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 20
        return flow
    }
}
