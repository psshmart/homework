//
//  PinnedCollectionViewCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class PinnedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Instance Properties
    
    private lazy var profileImage: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.cornerRadius = 48 / 2
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.font = .habibiFont(style: .regular, size: 13)
        label.tintColor = .black
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage, name: String) {
        profileImage.image = image
        nameLabel.text = name
    }
    
    private func addSubviews() {
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
    }
    
    private func makeConstraints() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        let imageTopConstraint = profileImage.topAnchor.constraint(equalTo: contentView.topAnchor)
        let imageCenterXConstraint = profileImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let imageWidthConstraint = profileImage.widthAnchor.constraint(equalToConstant: 48)
        let imageHeightConstraint = profileImage.heightAnchor.constraint(equalToConstant: 48)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let labelCenterXConstraint = nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let labelTopConstraint = nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8)
        let labelBottomConstraint = nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        NSLayoutConstraint.activate([imageCenterXConstraint, imageTopConstraint, imageWidthConstraint, imageHeightConstraint, labelTopConstraint, labelCenterXConstraint, labelBottomConstraint])
    }
}
