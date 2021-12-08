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
        let stackView = UIStackView(arrangedSubviews: [blueTextContainer, greyTextContainer])
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    let blueTextContainer: UIView = {
        return UIView(frame: .zero)
    }()
    let greyTextContainer: UIView = {
        return UIView(frame: .zero)
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
            blueTextContainer.widthAnchor.constraint(lessThanOrEqualToConstant: 54.0)
        ])
        embed(subview: stackView, padding: .init(top: 0, left: 10, bottom: 0, right: 20))
        blueTextContainer.embed(subview: blueText)
        greyTextContainer.embed(subview: greyText)
    }
}
