//
//  MessageCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 24.01.2022.
//

import UIKit

class MyMessageCell: UITableViewCell {
    
    // MARK: - Instance Properties
    
    private lazy var messageView: ChatView = {
        let view = ChatView()
        view.makeRoundedCorners(from: true)
        view.backgroundColor = UIColor(named: "myMessageColor")
        view.textLabel.textColor = .white
        
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = .habibiFont(style: .regular, size: 12)
        label.textColor = UIColor(named: "grayText")
        
        return label
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
        contentView.addSubview(messageView)
        contentView.addSubview(timeLabel)
    }
    
    private func makeConstraints() {
        messageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(24)
            make.width.lessThanOrEqualTo(268)
            make.trailing.equalToSuperview().inset(16)
        }
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.equalTo(messageView.snp.bottom)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Public Methods
    
    func config(text: String, date: String) {
        messageView.textLabel.text = text
        timeLabel.text = date
    }
    
}
