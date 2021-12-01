//
//  SectionGroup.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

final class SectionGroup: UIView {
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
        return collection
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SectionGroup {
    func layoutBinds() {
        NSLayoutConstraint.activate([
        ])
        embed(subview: stackView, padding: .init(top: 10, left: 0, bottom: 10, right: 0))
    }
}
