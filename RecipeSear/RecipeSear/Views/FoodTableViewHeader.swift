//
//  FoodTableViewHeader.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/09.
//

import UIKit

class FoodTableViewHeader: UIView {
    var recipe: [String : String] = ["imageUrl" : "", "calorie" : "", "carbohydrate" : "", "protein" : "", "province" : "", "salt" : ""] {
        didSet {
            NetworkManager.shared.loadImage(imageUrl: recipe["imageUrl"], view: foodImageView)
            calorieLabel.text = "열량\n\(recipe["calorie"] ?? "")"
            carbohydrateLabel.text = "탄수화물\n\(recipe["carbohydrate"] ?? "")"
            proteinLabel.text = "단백질\n\(recipe["protein"] ?? "")"
            provinceLabel.text = "지방\n\(recipe["province"] ?? "")"
            saltLabel.text = "나트륨\n\(recipe["salt"] ?? "")"
        }
    }
    
        let foodImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(systemName: "book.closed.fill")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let calorieLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "열량"
            label.numberOfLines = 2
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        let carbohydrateLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "탄수화물"
            label.numberOfLines = 2
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        let proteinLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "단백질"
            label.numberOfLines = 2
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        let provinceLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "지방"
            label.numberOfLines = 2
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
        let saltLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 18)
            label.text = "나트륨"
            label.numberOfLines = 2
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let labelStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .horizontal
            sv.distribution  = .fillEqually
            sv.alignment = .fill
            sv.spacing = 0
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
    
        let totalStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.distribution  = .fill
            sv.alignment = .fill
            sv.spacing = 0
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
            setConstraints()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        
        private func setupView() {
            labelStackView.addArrangedSubview(calorieLabel)
            labelStackView.addArrangedSubview(carbohydrateLabel)
            labelStackView.addArrangedSubview(proteinLabel)
            labelStackView.addArrangedSubview(provinceLabel)
            labelStackView.addArrangedSubview(saltLabel)
            
            totalStackView.addArrangedSubview(foodImageView)
            totalStackView.addArrangedSubview(labelStackView)
            
            self.addSubview(totalStackView)
        }
    
        private func setConstraints() {
            NSLayoutConstraint.activate([
                totalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                totalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                totalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                totalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
            
            NSLayoutConstraint.activate([
                labelStackView.heightAnchor.constraint(equalToConstant: 80)
            ])
        }

}
