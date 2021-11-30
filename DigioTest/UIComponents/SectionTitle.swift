//
//  SectionTitle.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 30/11/21.
//

import Foundation
import UIKit

class SectionTitle: UIView {
    // MARK: - UI
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [blueText, greyText])
        return stackView
    }()
    lazy var blueText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#00226A")
        label.textAlignment = .left
        label.font = UIFont(name: "Outfit-Medium", size: 23.0)
        return label
    }()
    lazy var greyText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#BFBFBF")
        label.textAlignment = .left
        label.font = UIFont(name: "Outfit-Medium", size: 23.0)
        return label
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

private extension SectionTitle {
    func layoutBinds() {
        NSLayoutConstraint.activate([
        ])
        
        embed(subview: stackView)
    }
}
