//
//  ViewController.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/05/31.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private var searchVC = SearchBarViewController()
    private let foodInfoVC = FoodInfoViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
        setupSearchBar()
        setupTableView()
        setupConstraints()
    }
    
    func setupNaviBar() {
        let customTitleLabel = UILabel()
        customTitleLabel.text = "Recipe Search"
        customTitleLabel.textColor = .black // 원하는 텍스트 색상으로 변경
        customTitleLabel.font = UIFont.systemFont(ofSize: 33, weight: .bold) // 원하는 폰트로 변경
        customTitleLabel.sizeToFit()

        let leftBarButtonItem = UIBarButtonItem(customView: customTitleLabel)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        self.navigationItem.backButtonTitle = ""
    }
    
    func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: searchVC)
        searchController.showsSearchResultsController = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "검색어를 입력해주세요."
        searchVC.delegate = self

        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }

                definesPresentationContext = true
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorColor = .darkGray
        tableView.separatorStyle = .none

        tableView.register(MyPickCell.self, forCellReuseIdentifier: "MyPickCell")
        tableView.register(RecentlyPickCell.self, forCellReuseIdentifier: "RecentlyPickCell")
        
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPickCell", for: indexPath) as! MyPickCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentlyPickCell", for: indexPath) as! RecentlyPickCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyPickCell", for: indexPath) as! MyPickCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("눌림")
        NetworkManager.shared.fetchMusic(searchTerm: "") { result in
            switch result {
            case .success(let recipes):
                self.searchVC.recipeAry = recipes.cookrcp01.row
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: SearchBarProtocol {
    func pushview(recipe: [String : String]) {
        foodInfoVC.recipe = recipe
        foodInfoVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(foodInfoVC, animated: true)
    }
}
