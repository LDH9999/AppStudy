//
//  RecentlyPickCell.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/01.
//

import UIKit
import ImageSlideshow

class RecentlyPickCell: UITableViewCell {
    private var uiImage = [UIImage(systemName: "book.closed.fill"), UIImage(systemName: "book.closed.fill"), UIImage(systemName: "book.closed.fill")]
    
    private var imageSlider = ImageSlideshow()
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.text = "Recently Pick"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupImageSlider()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(cellLabel)
        stackView.addArrangedSubview(imageSlider)
        
        contentView.addSubview(stackView)
    }
    
    func setupImageSlider() {
        imageSlider.translatesAutoresizingMaskIntoConstraints = false
        
        var imageAry: [ImageSource] = []
        for i in 0..<uiImage.count {
            let source = ImageSource(image: uiImage[i]!)
            imageAry.append(source)
        }
        imageSlider.setImageInputs(imageAry)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            cellLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
