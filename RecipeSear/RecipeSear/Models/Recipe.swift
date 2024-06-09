//
//  Recipe.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/03.
//

import Foundation

struct Recipes: Codable {
    let cookrcp01: Recipe

    enum CodingKeys: String, CodingKey {
        case cookrcp01 = "COOKRCP01"
    }
}

// MARK: - Cookrcp01
struct Recipe: Codable {
    let totalCount: String
    let row: [[String: String]]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case row
    }
}



