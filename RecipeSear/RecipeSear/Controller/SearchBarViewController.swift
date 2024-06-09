//
//  SearchBarViewController.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/01.
//

import UIKit

protocol SearchBarProtocol: AnyObject {
    func pushview(recipe: [String : String])
}

class SearchBarViewController: UIViewController {
    var recipeAry: [[String : String]]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    weak var delegate: SearchBarProtocol?
    
    let keywordButton1: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("밥", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let keywordButton2: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("반찬", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let keywordButton3: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("국&찌개", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let keywordButton4: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("후식", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let keywordButton5: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.setTitle("기타", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution  = .fillEqually
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private var collectionView:  UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    let totalstackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setCollectionView()
        setupStackView()
        setupConstraints()
    }
    
    func setCollectionView() {
        collectionView.register(SearchRecipeCell.self, forCellWithReuseIdentifier: "SearchRecipeCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(keywordButton1)
        stackView.addArrangedSubview(keywordButton2)
        stackView.addArrangedSubview(keywordButton3)
        stackView.addArrangedSubview(keywordButton4)
        stackView.addArrangedSubview(keywordButton5)
        
        totalstackView.addArrangedSubview(stackView)
        totalstackView.addArrangedSubview(collectionView)
        
        view.addSubview(totalstackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            totalstackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            totalstackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            totalstackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            totalstackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

extension SearchBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let rowsCount = recipeAry?.count else { return 0 }
        return rowsCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchRecipeCell", for: indexPath) as! SearchRecipeCell
        let imageUrl = recipeAry?[indexPath.row]["ATT_FILE_NO_MAIN"]
        cell.imageUrl = NetworkManager.shared.convertToHTTPS(urlString: imageUrl ?? "")
        return cell
    }
}

extension SearchBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 5
        let totalSpacing = (2 * spacing) + ((3 - 1) * spacing)
        let width = (collectionView.bounds.width - totalSpacing) / 3
        return CGSize(width: width, height: collectionView.bounds.height / 5)
    }
}

extension SearchBarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipe = recipeAry?[indexPath.row]
        delegate?.pushview(recipe: recipe!)
    }
}
