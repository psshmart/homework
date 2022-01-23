//
//  ChatTableViewCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    // MARK: - Instance Properties
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40 / 2
        
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: 14)
        label.textColor = UIColor(named: "lightBlack")
        
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: 14)
        label.textColor = UIColor(named: "grayText")
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: 12)
        
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(messageLabel)
        
        return stackView
    }()
    
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
        let topImageConstraint = profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 26)
        let bottomImageConstraint = profileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -26)
        let leadingImageConstraint = profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
        
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        let centerYStackViewConstraint = textStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        let leadingStackViewConstraint = textStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let topDateLabelConstraint = dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24)
        let trailingDateLabelConstraint = dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        
        NSLayoutConstraint.activate([topImageConstraint, bottomImageConstraint, leadingImageConstraint, centerYStackViewConstraint, leadingStackViewConstraint, topDateLabelConstraint, trailingDateLabelConstraint])
    }
    
    func configure(image: UIImage, name: String, message: String, date: String) {
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.messageLabel.text = message
        self.dateLabel.text = date
    }
}
