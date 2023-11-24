//
//  MainCellTableViewCell.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 12.11.2023.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {

    static let identifire = "MainTableViewCell"
    
    
    //MARK: UI
    private var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10
        
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()

    private var favouriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25

        button.addTarget(nil, action: #selector(didTapButton), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup views
    private func setupViews() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(statusLabel)
        
        favouriteButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(favouriteButton)
        
        setupConstraints()
    }
    
    // MARK: Setup constraints
    private func setupConstraints() {
        guard let superview else { return }
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 10),
            contentView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
//            nameLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
//            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            favouriteButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            favouriteButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            favouriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            favouriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            favouriteButton.widthAnchor.constraint(equalToConstant: 35),
            favouriteButton.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    @objc
    private func didTapButton() {
        
    }
    
}
