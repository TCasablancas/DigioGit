//
//  UserHeader.swift
//  DigioTest
//
//  Created by Thiago Augusto da Costa Silva on 01/12/21.
//

import Foundation
import UIKit

final class UserHeader: UIView {
    // MARK: - UI
    
    var name: String?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImg, userNameContainer])
        return stackView
    }()
    lazy var userImg: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.cornerRadius = 15
        return image
    }()
    lazy var userName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#00226A")
        label.font = UIFont(name: "Outfit-Medium", size: 16.0)
        label.text = "Olá, \(name)"
        return label
    }()
    let userNameContainer: UIView = {
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

private extension UserHeader {
    func layoutBinds() {
        NSLayoutConstraint.activate([
            userImg.widthAnchor.constraint(equalToConstant: 30),
            userImg.heightAnchor.constraint(equalToConstant: 30)
        ])
        embed(subview: stackView)
        userNameContainer.embed(subview: userName, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        
    }
}
