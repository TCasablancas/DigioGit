//
//  SectionGroup.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import Kingfisher
import UIKit

private let reuseIdentifier = "Cell"

final class SectionGroup: UIView {
    // MARK: - Properties
    var viewController: UIViewController?
    var imageURL: String?
    var productTitle: String?
    var productDescription: String?
    var model = [HomeModel.Data]()
    var hasSlider: Bool
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    lazy var sectionTitle: SectionTitle = {
        return SectionTitle()
    }()
    private lazy var viewContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .gray
        view.layer.cornerRadius = 8
        view.heightAnchor.constraint(equalToConstant: 120).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30.0).isActive = true
        return view
    }()
    
    /// Main Static Image Container
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(showProduct), for: .touchUpInside)
        return button
    }()
    lazy var staticImage: CellImageContainer = {
        let view = CellImageContainer()
        return view
    }()
    lazy var staticImageContainer: UIView = {
        return UIView(frame: .zero)
    }()
    
    /// Products Image Container
    lazy var productImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    lazy var productImageContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .gray
        return view
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
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = false
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    lazy var scrollViewStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        return UIImageView()
    }()
    
    let data = ["https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
                "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png"]
    
    // MARK: - Init
    
    init(hasSlider: Bool) {
        self.hasSlider = hasSlider
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SectionGroup: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
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
        guard
            let image = imageURL,
            let description = productDescription,
            let title = productTitle else {
            return
        }
        let productView = ProductViewController(imageURL: image, productTitle: title, productDescription: description)
        self.viewController?.navigationController?.pushViewController(productView, animated: true)
    }
}

extension SectionGroup {
    private func layoutBinds() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(mainScrollView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 180),
            staticImage.heightAnchor.constraint(equalToConstant: 120),
            productImageContainer.heightAnchor.constraint(equalToConstant: 120),
            productImageContainer.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        embed(subview: stackView)
        mainScrollView.embed(subview: scrollViewStack,
                             padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        staticImageContainer.embed(subview: actionButton)
        staticImageContainer.embed(subview: staticImage)
        
        stackView.addArrangedSubview(sectionTitle)
        stackView.addArrangedSubview(mainScrollView)
        stackView.addArrangedSubview(hasSlider ? staticImageContainer : collectionView)
    }
    
    func displayTitle(_ show: Bool) {
        self.sectionTitle.isHidden = !show ? true : false
    }
    
    func displayStaticImage(_ show: Bool) {
        self.mainScrollView.isHidden = show
        self.staticImageContainer.isHidden = !show
        
        if !show {
            viewContainer.embed(subview: staticImageContainer)
        }
    }
    
    private func flowLayout() -> UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: 150.0)
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 0
        flow.minimumInteritemSpacing = 20
        return flow
    }
}
