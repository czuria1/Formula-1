//
//  DriverCell.swift
//  Formula 1
//
//  Created by Gio on 11/4/19.
//  Copyright © 2019 Gio. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - SwiftUI View
struct DriverCell: View {
    @ObservedObject var imageLoader = ImageLoader()
    
    let firstName: String
    let lastName: String
    let driverNumber: String
    
    var body: some View {
        HStack {
            Image(uiImage: imageLoader.image ?? UIImage(systemName: "doc.text") as! UIImage)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .shadow(color: .gray, radius: 5.0, x: 0.0, y: 2.0)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    Text(firstName)
                        .font(Font(UIFont.Formula1Font.Black)
                            .weight(.light))
                    
                    Text(lastName)
                        .font(Font(UIFont.Formula1Font.Black)
                            .weight(.medium))
                    
                }
                
                Text(driverNumber)
                    .font(Font(UIFont.Formula1Font.Black)
                        .weight(.regular))
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            self.imageLoader.getImage(urlString: DriverImgUrl.hamilton.rawValue)
        }
    }
}

enum DriverImgUrl: String {
    case leclerc =  ""
    case vettel = "d"
    case hamilton = "https://www.formula1.com/content/fom-website/en/drivers/lewis-hamilton/_jcr_content/image.img.1024.medium.jpg"
    case bottas = "c"
    case verstappen = "v"
    case albon = "b"
    case sainz = "s"
}

// MARK: - UIKit View
class DriverKitCell: UITableViewCell {
    static let reuseIdentifier = String(describing: self)
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameLabel, lastNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(stackView)
    }
    
    func activateConstraints() {
        let inset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset * 1.5),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset * 2)
        ])
    }
    
    func configure(_ driver: DriverStanding) {
        firstNameLabel.text = driver.driver.givenName
        lastNameLabel.text = driver.driver.familyName
    }
}
