//
//  SectionGroup.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

final class SectionGroup: UIView {
//    var viewContoller: UIViewController
//    public var cardsModel: [HomeModel] = []
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sectionTitle, collectionView])
        stackView.axis = .vertical
        return stackView
    }()
    lazy var sectionTitle: SectionTitle = {
        return SectionTitle()
    }()
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView()
//        collection.delegate = self
//        collection.dataSource = self
        return collection
    }()
    
    //    lazy var mainScrollView: UIScrollView = {
    //        let scrollView = UIScrollView()
    //        scrollView.clipsToBounds = false
    //        scrollView.bounces = false
    //        scrollView.showsHorizontalScrollIndicator = false
    //        scrollView.showsVerticalScrollIndicator = false
    //        return scrollView
    //    }()
//        lazy var cards: [SectionGroupCell] = {
//            return [SectionGroupCell()]
//        }()
    //    lazy var scrollViewStack: UIStackView = {
    //        let stackView = UIStackView(frame: .zero)
    //        stackView.axis = .horizontal
    //        stackView.spacing = 16.0
    //        stackView.translatesAutoresizingMaskIntoConstraints = false
    //        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //        return stackView
    //    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension SectionGroup: UICollectionViewDelegate, UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cards.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath) as? SectionGroupCell else {
//            return UICollectionViewCell()
//        }
//        let item = cards[indexPath.row]
//
//        cell.configure(with: item)
//
//        return cell
//    }
//
//
//}

extension SectionGroup {
    //    func updateView() {
    //        var cards: [UIView] = []
    //        self.cards = cards
    //
    //        for card in cards {
    //            scrollViewStack.addArrangedSubview(card)
    //        }
    //    }
    
    private func layoutBinds() {
        NSLayoutConstraint.activate([
        ])
        embed(subview: stackView, padding: .init(top: 10, left: 0, bottom: 10, right: 0))
    }
}
