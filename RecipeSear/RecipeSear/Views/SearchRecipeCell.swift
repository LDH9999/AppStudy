//
//  SearchRecipeCell.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/02.
//

import UIKit

class SearchRecipeCell: UICollectionViewCell {
    var imageUrl: String? {
        didSet {
            NetworkManager.shared.loadImage(imageUrl: imageUrl, view: self.foodImageView)
        }
    }
    
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.masksToBounds = true
    }
    
    func setConstraints() {
        contentView.addSubview(foodImageView)

        NSLayoutConstraint.activate([
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}
