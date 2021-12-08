//
//  CellImageContainer.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import Kingfisher
import UIKit

public class CellImageContainer: UICollectionViewCell {
    private var model: Spotlight?
    
    // MARK: - UI
    
    public lazy var container: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 6
        view.backgroundColor = .lightGray
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.15
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        return view
    }()
    private lazy var cellImageContainer: UIView = {
        return UIView(frame: .zero)
    }()
    lazy var cellImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    // MARK: - Init
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CellImageContainer {
    func layoutBinds() {
        self.addSubview(container)
        container.addSubview(cellImageContainer)
        cellImageContainer.addSubview(cellImage)
        
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 120),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            cellImageContainer.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            cellImageContainer.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        embed(subview: container,
              padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        container.embed(subview: cellImageContainer)
        cellImageContainer.embed(subview: cellImage,
                                 padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func setupCell(_ model: String) {
        if let url = URL(string:  model) {
            self.cellImage.kf.indicatorType = .activity
            self.cellImage.kf.setImage(with: url)
        } else {
            self.cellImage.image = UIImage(named: "")
        }
    }
}
