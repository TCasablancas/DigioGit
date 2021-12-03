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
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.6
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.2, height: 0.2)
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var cellImage: UIImageView = {
        return UIImageView()
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
        embed(subview: container, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        container.embed(subview: cellImage)
    }
}
