//
//  MyPickCollectionCell.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/01.
//

import UIKit

class MyPickCollectionCell: UICollectionViewCell {
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "book.closed.fill")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
