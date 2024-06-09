//
//  SecondViewController.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/05/31.
//

import UIKit

class SecondViewController: UIViewController {
    private let tableView = UITableView()
    private var imageAry = [UIImage(systemName: "book.closed.fill"), UIImage(systemName: "book.closed.fill"), UIImage(systemName: "book.closed.fill")]
    private var isEditingMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupConstraints()
    }
    
    func setupNaviBar() {
        let customTitleLabel = UILabel()
        customTitleLabel.text = "Recipes"
        customTitleLabel.textColor = .black // 원하는 텍스트 색상으로 변경
        customTitleLabel.font = UIFont.systemFont(ofSize: 33, weight: .bold) // 원하는 폰트로 변경
        customTitleLabel.sizeToFit()

        let leftBarButtonItem = UIBarButtonItem(customView: customTitleLabel)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
        setRightButtonItem(item: rightButtonItem)
    }
    
    func setRightButtonItem(item: UIBarButtonItem) {
        item.tintColor = .systemGreen
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func editButtonTapped() {
        if isEditingMode == false {
            let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editButtonTapped))
            setRightButtonItem(item: rightButtonItem)
            tableView.setEditing(true, animated: true)
            isEditingMode = true
        } else {
            let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
            setRightButtonItem(item: rightButtonItem)
            tableView.setEditing(false, animated: true)
            isEditingMode = false
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.rowHeight = 120
        tableView.backgroundColor = .clear
        tableView.separatorColor = .darkGray

        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "FoodCell")
    }
    
    func setupConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension SecondViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! MyTableViewCell
        cell.foodImageView.image = imageAry[indexPath.row]
        cell.separatorInset = UIEdgeInsets.zero
        return cell
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        imageAry.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
}
