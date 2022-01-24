//
//  ChatController.swift
//  homework_2
//
//  Created by Svetlana Safonova on 24.01.2022.
//

import UIKit

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var backImage: UIImage = {
        var image = UIImage(named: "backIcon")?.withRenderingMode(.alwaysOriginal)
        
        return image ?? UIImage()
    }()
    
    private lazy var tableView = UITableView()
    
    private lazy var footerView = WriteMessageView()
    
    private var data: [DatesMessages] = []
    private var profileImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(footerView)
        view.addSubview(tableView)
        footerView.delegate = self
        setupTableView()
        setupNavigationBar()
        makeConstraints()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.habibiFont(style: .regular, size: 14)]
        navBarAppearance.backgroundColor = .systemGray6
        navigationController?.navigationBar.isTranslucent = false
        navBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
                
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupTableView() {
        tableView.register(MyMessageCell.self, forCellReuseIdentifier: "MessageIdentifier")
        tableView.register(ToMeMessageCell.self, forCellReuseIdentifier: "ToMeMessageIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalTo(footerView.snp.top)
        }
        footerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview()
        }
    }
    
    func config(data: [DatesMessages], image: UIImage, name: String) {
        self.data = data
        self.profileImage = image
        navigationItem.title = name
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].messages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = data[indexPath.section].messages else {
            return UITableViewCell()
        }
        if model[indexPath.row].isFrom ?? false {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessageIdentifier", for: indexPath) as? MyMessageCell else {
                return UITableViewCell()
            }
            cell.config(text: model[indexPath.row].messageTest ?? "", date: model[indexPath.row].time ?? "")
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToMeMessageIdentifier", for: indexPath) as? ToMeMessageCell else {
                return UITableViewCell()
            }
            cell.config(text: model[indexPath.row].messageTest ?? "", date: model[indexPath.row].time ?? "", image: profileImage ?? UIImage())
            return cell
        }
       
    }
}

extension ChatController: WriteMessageViewDelegate {
    func sendMessage(text: String) {
        let lastIndex = data.endIndex
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a "
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let currentDateStr = formatter.string(from: Date())
        if lastIndex == .zero {
            data.append(DatesMessages(date: "Today",
                                      messages: [
                                        Message(isFrom: true,
                                                messageTest: text,
                                                time: currentDateStr)]))
        } else {
            data[lastIndex - 1].messages?.append(Message(isFrom: true,
                                                messageTest: text,
                                                time: currentDateStr))
        }
        tableView.reloadData()
    }
}
