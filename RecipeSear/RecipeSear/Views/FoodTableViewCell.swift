//
//  FoodTableViewCell.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/04.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    let recipeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "메뉴얼 정보"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "book.closed.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        contentView.addSubview(recipeLabel)
        contentView.addSubview(foodImageView)
        
        NSLayoutConstraint.activate([
            recipeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            recipeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            recipeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            foodImageView.topAnchor.constraint(equalTo: recipeLabel.bottomAnchor, constant: 0),
            foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            foodImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
