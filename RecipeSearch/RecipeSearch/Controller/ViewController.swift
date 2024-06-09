//
//  ViewController.swift
//  RecipeSearch
//
//  Created by 임동현 on 2024/05/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNaviBar()
    }
    
    func setupNaviBar() {
        let customTitleLabel = UILabel()
        customTitleLabel.text = "Recipe Search"
        customTitleLabel.textColor = .black // 원하는 텍스트 색상으로 변경
        customTitleLabel.font = UIFont.systemFont(ofSize: 33, weight: .bold) // 원하는 폰트로 변경
        customTitleLabel.sizeToFit()

        let leftBarButtonItem = UIBarButtonItem(customView: customTitleLabel)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }


}

