//
//  FoodInfoViewController.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/04.
//

import UIKit

class FoodInfoViewController: UIViewController {
    var recipe: [String : String]? {
        didSet {
            self.title = recipe?["RCP_NM"]
            headerView.recipe["imageUrl"] = NetworkManager.shared.convertToHTTPS(urlString: recipe?["ATT_FILE_NO_MAIN"] ?? "")
            headerView.recipe["calorie"] = recipe?["INFO_ENG"]
            headerView.recipe["carbohydrate"] = recipe?["INFO_CAR"]
            headerView.recipe["protein"] = recipe?["INFO_PRO"]
            headerView.recipe["province"] = recipe?["INFO_FAT"]
            headerView.recipe["salt"] = recipe?["INFO_NA"]
        }
    }
    
    private let tableView = UITableView()
    private let headerView = FoodTableViewHeader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setScreen()
        setupTableView()
        setupConstraints()
    }
    
    func setScreen() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }
    
    func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(FoodTableViewCell.self, forCellReuseIdentifier: "FoodTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        headerView.frame.size.height = 400
        tableView.tableHeaderView = headerView
        
        tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension FoodInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! FoodTableViewCell
        return cell
    }
}

extension FoodInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}


