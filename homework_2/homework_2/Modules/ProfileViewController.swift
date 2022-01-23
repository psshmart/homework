//
//  ProfileViewController.swift
//  homework_2
//
//  Created by Svetlana Safonova on 07.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    
    enum Constants {
        enum Text {
            static let messages = "Messages"
            static let location = "Brooklyn, NY"
            static let backCustomArrow = "backCustomArrow"
            static let logout = "Logout"
            static let name = "Alex Tsimikas"
        }
        
        enum Numbers {
            static let buttonFontSize: CGFloat = 17
            static let labelFontSize: CGFloat = 14
            static let borderWidth: CGFloat = 1
            static let buttonHeight: CGFloat = 36
            static let two: CGFloat = 2
            static let largeTitleFontSize: CGFloat = 34
        }
        
        enum Insets {
            static let top: CGFloat = 6
            static let left: CGFloat = 65
            static let bottom: CGFloat = 6
            static let right: CGFloat = 32
        }
        
        enum Constraints {
            static let labelTop: CGFloat = 19
            static let labelLeading: CGFloat = 25
            static let buttonTop: CGFloat = 136
            static let buttonHeight: CGFloat = 36
            static let buttonWidth: CGFloat = 143
            static let imageLeading: CGFloat = 34
        }
    }

    // MARK: - Instance Properties
    
    private lazy var messagesBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(title: Constants.Text.messages,
                                     style: .plain,
                                     target: self,
                                     action: #selector(navigateToMessages))
        button.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: Constants.Numbers.buttonFontSize)], for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.location
        label.font = .habibiFont(style: .regular,
                                 size: Constants.Numbers.labelFontSize)
        label.tintColor = .black
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.Text.backCustomArrow)?.withRenderingMode(.alwaysOriginal))
        return imageView
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Text.logout, for: .normal)
        button.titleLabel?.font = .habibiFont(style: .regular,
                                              size: Constants.Numbers.labelFontSize)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = Constants.Numbers.borderWidth
        button.layer.cornerRadius = Constants.Numbers.buttonHeight / Constants.Numbers.two
        button.titleEdgeInsets = UIEdgeInsets(top: Constants.Insets.top,
                                              left: Constants.Insets.left,
                                              bottom: Constants.Insets.bottom,
                                              right: Constants.Insets.right)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Constants.Text.name
        navigationItem.rightBarButtonItem = messagesBarButtonItem
                
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: Constants.Numbers.largeTitleFontSize)]
        navBarAppearance.backgroundColor = .systemGray6
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.backButtonTitle = ""
                
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
        let labelTopConstraint = locationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Constraints.labelTop)
        let labelLeadingConstraint = locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Constraints.labelLeading)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        let buttonCenterConstraint = logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let buttonTopConstraint = logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Constraints.buttonTop)
        let buttonHeightConstraint = logoutButton.heightAnchor.constraint(equalToConstant: Constants.Constraints.buttonHeight)
        let buttonWidthConstraint = logoutButton.widthAnchor.constraint(equalToConstant: Constants.Constraints.buttonWidth)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageLeadingConstraint = imageView.leadingAnchor.constraint(equalTo: logoutButton.leadingAnchor, constant: Constants.Constraints.imageLeading)
        let imageCenterConstraint = imageView.centerYAnchor.constraint(equalTo: logoutButton.centerYAnchor)
        
        NSLayoutConstraint.activate([labelTopConstraint, labelLeadingConstraint, buttonTopConstraint, buttonCenterConstraint, buttonWidthConstraint, buttonHeightConstraint, imageCenterConstraint, imageLeadingConstraint])
    }
    
    // MARK: - Actions
    
    @objc private func navigateToMessages() {
        let viewController = MessagesViewController()
        navigationController?.pushViewController(viewController, animated: false)
    }
}
