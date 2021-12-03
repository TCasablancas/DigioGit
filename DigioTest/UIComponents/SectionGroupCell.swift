//
//  SectionGroupCell.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

class SectionGroupCell: UICollectionViewCell {
    
    var cellWidth: CGFloat
    var cellHeight: CGFloat
    
    // MARK: - UI
    
    private lazy var cellContainer: CellImageContainer = {
        return CellImageContainer(containerWidth: cellWidth, containerHeight: cellHeight)
    }()
    
    // MARK: - Init
    init(cellWidth: CGFloat, cellHeight: CGFloat) {
        self.cellWidth = cellWidth
        self.cellHeight = cellHeight
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: HomeModel) {
        
        let cell = self.cellContainer
        
        DispatchQueue.main.async {
            
        }
    }
}
