//
//  PinnedTableViewCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class PinnedTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    enum Constants {
        enum Numbers {
            static let fontSize: CGFloat = 12
            static let itemWidth: CGFloat = 80
            static let itemHeight: CGFloat = 72
            static let sectionInsetLeft: CGFloat = 8
        }
        
        enum Constraints {
            static let labelTop: CGFloat = 11
            static let labelLeft: CGFloat = 24
            static let collectionViewTop: CGFloat = 16
            static let collectionViewBottom: CGFloat = 20
            static let collectionViewHeight: CGFloat = 72
        }
        
        enum Identifier {
            static let pinnedCellIdentifier = "PinnedCell"
        }
        
        enum Text {
            static let pinnedText = "PINNED"
        }
    }
    
    // MARK: - Instance Properties
    
    private var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.pinnedText
        label.font = .habibiFont(style: .regular, size: Constants.Numbers.fontSize)
        
        return label
    }()
    
    private var chatsData: [ChatsModel] = []
    
    // MARK: - Instance Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupCollectionView()
        addSubviews()
        makeConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(collectionView)
        contentView.addSubview(label)
    }
    
    private func makeConstraint() {
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelTopConstraint = label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Constraints.labelTop)
        let labelLeftConstraint = label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.Constraints.labelLeft)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let collectionTopConstraint = collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Constants.Constraints.collectionViewTop)
        let collectionLeadingConstraint = collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let collectionTrailingConstraint = collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let collectionBottomConstraint = collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Constraints.collectionViewBottom)
        let collectionHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: Constants.Constraints.collectionViewHeight)
        
        NSLayoutConstraint.activate([labelTopConstraint, labelLeftConstraint, collectionTopConstraint, collectionLeadingConstraint, collectionTrailingConstraint, collectionBottomConstraint, collectionHeightConstraint])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constants.Numbers.itemWidth, height: Constants.Numbers.itemHeight)
        layout.sectionInset = .zero
        layout.minimumLineSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: .zero, left: Constants.Numbers.sectionInsetLeft, bottom: .zero, right: .zero)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        collectionView.register(PinnedCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifier.pinnedCellIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Public Methods
    
    func configure(data: [ChatsModel]) {
        self.chatsData = data
    }
}

// MARK: - CollectionViewDataSource

extension PinnedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.pinnedCellIdentifier, for: indexPath) as? PinnedCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(image: chatsData[indexPath.row].image ?? UIImage(), name: chatsData[indexPath.row].name ?? "")
        return cell
    }
    
}
