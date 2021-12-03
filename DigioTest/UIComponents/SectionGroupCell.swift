//
//  SectionGroupCell.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

class SectionGroupCell: UIView {
    // MARK: - UI
    
    private lazy var container: UIView = {
        return UIView(frame: .zero)
    }()
    
    private lazy var cellContainer: CellImageContainer = {
        return CellImageContainer()
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        layoutBinds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(with model: HomeModel) {
//
//        let cell = self.cellContainer
//
//        DispatchQueue.main.async {
//
//        }
//    }
    
    func layoutBinds() {
        NSLayoutConstraint.activate([
        ])
        embed(subview: container, padding: .init(top: 80, left: 20, bottom: 20, right: 20))
        container.embed(subview: cellContainer)
    }
}
