//
//  MyTableViewCell.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/01.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .darkGray
        label.text = "음식이름"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recipeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemGray2
        label.text = "조리방법"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let calorieLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .systemGray2
        label.text = "열량"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fillEqually
        sv.alignment = .fill
        sv.spacing = 1
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let foodStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupScreenView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScreenView() {
        self.contentView.addSubview(foodStackView)
        
        labelStackView.addArrangedSubview(foodNameLabel)
        labelStackView.addArrangedSubview(recipeLabel)
        labelStackView.addArrangedSubview(calorieLabel)
        
        foodStackView.addArrangedSubview(foodImageView)
        foodStackView.addArrangedSubview(labelStackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            foodStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            foodStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            foodStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            foodStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            foodImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
