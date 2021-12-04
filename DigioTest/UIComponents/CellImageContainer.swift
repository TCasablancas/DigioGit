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
    
    private lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 6
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.25
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.2, height: 0.9)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var cellImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFill
        return view
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

extension CellImageContainer {
    func layoutBinds() {
        self.addSubview(container)
        container.addSubview(cellImage)
        
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 120),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            cellImage.topAnchor.constraint(equalTo: container.topAnchor),
            cellImage.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            cellImage.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        ])
        
        embed(subview: container,
              padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        container.embed(subview: cellImage)
    }
}
