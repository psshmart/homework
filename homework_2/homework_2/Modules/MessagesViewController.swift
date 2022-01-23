//
//  MessagesViewController.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class MessagesViewController: UITableViewController {
    
    // MARK: - Instance Properties
    
    private var backImage: UIImage = {
        var image = UIImage(named: "backIcon")?.withRenderingMode(.alwaysOriginal)
        
        return image ?? UIImage()
    }()

    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = false
        
        return controller
    }()
    
    private var pinnedChatsData: [ChatsModel] = [
        ChatsModel(
            image: UIImage(named: "Kim")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Kim",
            lastMessage: "",
            timePassed: ""),
        ChatsModel(
            image: UIImage(named: "Steve")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Steve",
            lastMessage: "",
            timePassed: ""),
        ChatsModel(
            image: UIImage(named: "Mia")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Mia",
            lastMessage: "",
            timePassed: "")]
    
    private var chatsData: [ChatsModel] = [
        ChatsModel(
            image: UIImage(named: "Jessica")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Jessica Thompson",
            lastMessage: "Hey you! Are u there?",
            timePassed: "4h ago"),
        ChatsModel(
            image: UIImage(named: "Kat")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Kat Williams",
            lastMessage: "OMG! OMG! OMG!",
            timePassed: "5h ago"),
        ChatsModel(
            image: UIImage(named: "Jacob")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Jacob Washington",
            lastMessage: "Sure. Sunday works for me!",
            timePassed: "20/9/21"),
        ChatsModel(
            image: UIImage(named: "Leslie")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Leslie Alexander",
            lastMessage: "Sent you an invite for next monday.",
            timePassed: "19/9/21"),
        ChatsModel(
            image: UIImage(named: "Tony")?.withRenderingMode(.alwaysOriginal) ?? UIImage(),
            name: "Tony Monta",
            lastMessage: "How’s Alicia doing? Ask her to give m...",
            timePassed: "19/9/21"),
    ]
    
    // MARK: - Instance Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Who do you want to chat with?", attributes: [NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: 17)])
    }
    
    private func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "MESSAGES"

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: 17)]
        navBarAppearance.backgroundColor = .systemGray6
        navBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        navigationController?.navigationBar.isTranslucent = false
                
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupTableView() {
        tableView.register(PinnedTableViewCell.self, forCellReuseIdentifier: "PinnedTableViewCell")
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "ChatTableViewCell")
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
}

extension MessagesViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PinnedTableViewCell", for: indexPath) as? PinnedTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(data: pinnedChatsData)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as? ChatTableViewCell else {
                return UITableViewCell()
            }
            let model = chatsData[indexPath.row - 1]
            cell.configure(image: model.image ?? UIImage(), name: model.name ?? "", message: model.lastMessage ?? "", date: model.timePassed ?? "")
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsData.count + 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
