//
//  ChatTableViewCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    enum Constants {
        enum Colors {
            static let lightBlack = "lightBlack"
            static let grayText = "grayText"
        }
        
        enum Numbers {
            static let imageWidth: CGFloat = 40
            static let fontSize: CGFloat = 14
            static let dateFontSize: CGFloat = 12
            static let two: CGFloat = 2
            static let stackViewSpacing: Int = 4
        }
        
        enum Constraints {
            static let imageTopBottom: CGFloat = 26
            static let imageLeading: CGFloat = 24
            static let stackViewLeading: CGFloat = 8
        }
        
    }
    
    // MARK: - Instance Properties
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Constants.Numbers.imageWidth / Constants.Numbers.two
        
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: Constants.Numbers.fontSize)
        label.textColor = UIColor(named: Constants.Colors.lightBlack)
        
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: Constants.Numbers.fontSize)
        label.textColor = UIColor(named: Constants.Colors.grayText)
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: Constants.Numbers.dateFontSize)
        
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Constants.Constraints.stackViewLeading
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(messageLabel)
        
        return stackView
    }()
    
    // MARK: - Instance Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(textStackView)
        contentView.addSubview(dateLabel)
        contentView.backgroundColor = .white
    }
    
    private func makeConstraints() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        let topImageConstraint = profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Constraints.imageTopBottom)
        let bottomImageConstraint = profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Constraints.imageTopBottom)
        let leadingImageConstraint = profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Constraints.imageLeading)
        
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        let centerYStackViewConstraint = textStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        let leadingStackViewConstraint = textStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: Constants.Constraints.stackViewLeading)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let topDateLabelConstraint = dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Constraints.imageLeading)
        let trailingDateLabelConstraint = dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.Constraints.imageLeading)
        
        NSLayoutConstraint.activate([topImageConstraint, bottomImageConstraint, leadingImageConstraint, centerYStackViewConstraint, leadingStackViewConstraint, topDateLabelConstraint, trailingDateLabelConstraint])
    }
    
    // MARK: - Public Methods
    func configure(image: UIImage, name: String, message: String, date: String) {
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.messageLabel.text = message
        self.dateLabel.text = date
    }
}
