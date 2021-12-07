//
//  ProfileViewController.swift
//  homework_2
//
//  Created by Svetlana Safonova on 07.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Instance Properties
    
    private lazy var messagesBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Messages",
                                     style: .plain,
                                     target: nil,
                                     action: nil)
        button.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: 17)], for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Brooklyn, NY"
        label.font = .habibiFont(style: .regular, size: 14)
        label.tintColor = .black
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backCustomArrow")?.withRenderingMode(.alwaysOriginal))
        return imageView
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.titleLabel?.font = .habibiFont(style: .regular, size: 14)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 36 / 2
        button.titleEdgeInsets = UIEdgeInsets(top: 6, left: 65, bottom: 6, right: 32)
        button.addSubview(imageView)
        return button
    }()
    
    // MARK: - Instance Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupView()
        makeConstraints()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Alex Tsimikas"
        navigationItem.rightBarButtonItem = messagesBarButtonItem
                
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: 34)]
        navBarAppearance.backgroundColor = .systemGray6
        navigationController?.navigationBar.isTranslucent = false
                
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(locationLabel)
        view.addSubview(logoutButton)
    }
    
    private func makeConstraints() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        let labelTopConstraint = locationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 19)
        let labelLeadingConstraint = locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonCenterConstraint = logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let buttonTopConstraint = logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 136)
        let buttonHeightConstraint = logoutButton.heightAnchor.constraint(equalToConstant: 36)
        let buttonWidthConstraint = logoutButton.widthAnchor.constraint(equalToConstant: 143)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: logoutButton.leadingAnchor, constant: 34)
        let imageCenterConstraint = imageView.centerYAnchor.constraint(equalTo: logoutButton.centerYAnchor)
        NSLayoutConstraint.activate([labelTopConstraint, labelLeadingConstraint, buttonTopConstraint, buttonCenterConstraint, buttonWidthConstraint, buttonHeightConstraint, imageCenterConstraint, imageLeadingConstraint])
    }
}
