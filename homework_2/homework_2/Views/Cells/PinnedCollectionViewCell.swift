//
//  PinnedCollectionViewCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class PinnedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    
    enum Constants {
        enum Numbers {
            static let imageWidth: CGFloat = 48
            static let two: CGFloat = 2
            static let fontSize: CGFloat = 13
        }
        
        enum Constraints {
            static let labelTop: CGFloat = 8
        }
    }
    
    // MARK: - Instance Properties
    
    private lazy var profileImage: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.Numbers.imageWidth / Constants.Numbers.two
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .habibiFont(style: .regular, size: Constants.Numbers.fontSize)
        label.tintColor = .black
        
        return label
    }()
    
    // MARK: - Instance Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
    }
    
    private func makeConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        let imageTopConstraint = profileImage.topAnchor.constraint(equalTo: contentView.topAnchor)
        let imageCenterXConstraint = profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let imageWidthConstraint = profileImage.widthAnchor.constraint(equalToConstant: Constants.Numbers.imageWidth)
        let imageHeightConstraint = profileImage.heightAnchor.constraint(equalToConstant: Constants.Numbers.imageWidth)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let labelCenterXConstraint = nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let labelTopConstraint = nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Constants.Constraints.labelTop)
        let labelBottomConstraint = nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        NSLayoutConstraint.activate([imageCenterXConstraint, imageTopConstraint, imageWidthConstraint, imageHeightConstraint, labelTopConstraint, labelCenterXConstraint, labelBottomConstraint])
    }
    
    // MARK: - Public Methods
    
    func configure(image: UIImage, name: String) {
        profileImage.image = image
        nameLabel.text = name
    }
}
