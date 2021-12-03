//
//  CellImageContainer.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

final class CellImageContainer: UIView {
    // MARK: - UI
    
    var containerWidth: CGFloat
    var containerHeight: CGFloat
    
    private lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 6
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.6
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    // MARK: - Init
    
    init(containerWidth: CGFloat, containerHeight: CGFloat) {
        self.containerWidth = containerWidth
        self.containerHeight = containerHeight
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CellImageContainer {
    func layoutBinds() {
        NSLayoutConstraint.activate([
            container.widthAnchor.constraint(equalToConstant: containerWidth),
            container.heightAnchor.constraint(equalToConstant: containerHeight)
        ])
        embed(subview: container, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        container.embed(subview: cellImage)
    }
}
