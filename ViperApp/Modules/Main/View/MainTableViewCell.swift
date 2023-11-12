//
//  MainCellTableViewCell.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 12.11.2023.
//

import UIKit

class MainTableViewCell: UITableViewCell {

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
    
    private func setupViews() {
        
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        
    }
    
    @objc
    private func didTapButton() {
        
    }
    
}
