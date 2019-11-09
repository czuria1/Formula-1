//
//  ConstructorCollectionKitCell.swift
//  Formula 1
//
//  Created by Gio on 11/5/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit

class ConstructorCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: self)
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        activateConstraints()
        applySkin()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    func applySkin() {
        let contentViewLayer = contentView.layer
        contentViewLayer.borderColor = UIColor.darkGray.cgColor
        contentViewLayer.borderWidth = 3
        contentViewLayer.cornerRadius = 35
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
