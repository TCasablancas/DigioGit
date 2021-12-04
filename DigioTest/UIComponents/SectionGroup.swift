//
//  SectionGroup.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

final class SectionGroup: UIView {
    // MARK: - Properties
    
    private let cellWidth = UIScreen.main.bounds.width - 80.0
    
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sectionTitle, staticImageContainer, mainScrollView])
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
        view.heightAnchor.constraint(equalToConstant: 170).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30.0).isActive = true
        return view
    }()
    
    /// Main Static Image Container
    lazy var staticImage: CellImageContainer = {
        return CellImageContainer()
    }()
    lazy var staticImageContainer: UIView = {
        let view = UIView(frame: .zero)
        return view
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
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SectionGroup {
    private func layoutBinds() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(mainScrollView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 180),
            staticImage.heightAnchor.constraint(equalToConstant: 120),
            staticImageContainer.widthAnchor.constraint(equalTo: widthAnchor),
            productImageContainer.heightAnchor.constraint(equalToConstant: 120),
            productImageContainer.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        embed(subview: stackView)
        mainScrollView.embed(subview: scrollViewStack,
                             padding: .init(top: 0, left: 30, bottom: 0, right: 30))
        staticImageContainer.embed(subview: staticImage)
    }
    
    func setupStaticImage() {
        productImageContainer.embed(subview: productImage)
    }
    
    func setupArray(with view: UIView) {
        var cards: [UIView] = []
        cards.append(viewContainer)
        
        for card in cards {
            scrollViewStack.addArrangedSubview(card)
            card.widthAnchor.constraint(equalToConstant: cellWidth).isActive = true
            card.topAnchor.constraint(equalTo: scrollViewStack.topAnchor).isActive = true
        }
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
}
