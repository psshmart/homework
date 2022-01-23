//
//  PinnedTableViewCell.swift
//  homework_2
//
//  Created by Svetlana Safonova on 23.01.2022.
//

import UIKit

class PinnedTableViewCell: UITableViewCell {
    
    // MARK: - Instance Properties
    
    private var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "PINNED"
        label.font = .habibiFont(style: .regular, size: 12)
        
        return label
    }()
    
    private var chatsData: [ChatsModel] = []
    
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
        let labelTopConstraint = label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11)
        let labelLeftConstraint = label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        let collectionTopConstraint = collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        let collectionLeadingConstraint = collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let collectionTrailingConstraint = collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let collectionBottomConstraint = collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        let collectionHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 72)
        
        NSLayoutConstraint.activate([labelTopConstraint, labelLeftConstraint, collectionTopConstraint, collectionLeadingConstraint, collectionTrailingConstraint, collectionBottomConstraint, collectionHeightConstraint])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 72)
        layout.sectionInset = .zero
        layout.minimumLineSpacing = .zero
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        collectionView.register(PinnedCollectionViewCell.self, forCellWithReuseIdentifier: "PinnedCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(data: [ChatsModel]) {
        self.chatsData = data
    }
}

extension PinnedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PinnedCell", for: indexPath) as? PinnedCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(image: chatsData[indexPath.row].image ?? UIImage(), name: chatsData[indexPath.row].name ?? "")
        return cell
    }
    
}
