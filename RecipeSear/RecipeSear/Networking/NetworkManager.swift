//
//  NetworkManager.swift
//  RecipeSear
//
//  Created by 임동현 on 2024/06/03.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

final class NetworkManager {
    
    // 여러화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = NetworkManager()
    // 여러객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    typealias NetworkCompletion = (Result<Recipes, NetworkError>) -> Void
    
    // 네트워킹 요청하는 함수
    func fetchMusic(searchTerm: String, completion: @escaping NetworkCompletion) {
        let urlString = "https://openapi.foodsafetykorea.go.kr/api/sample/COOKRCP01/json/1/5"
        print(urlString)
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    // 실제 Request하는 함수 (비동기적 실행 ===> 클로저 방식으로 끝난 시점을 전달 받도록 설계)
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {
        //print(#function)
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
                return
            }
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            print(safeData)
            // 데이터 분석하기
            if let recipes = self.parseJSON(safeData) {
                print("Parse 실행")
                completion(.success(recipes))
            } else {
                print("Parse 실패")
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    // 받아본 데이터 분석하는 함수 (동기적 실행)
    private func parseJSON(_ recipeData: Data) -> Recipes? {
            //print(#function)
            // 성공
            do {
                let recipeDatas = try JSONDecoder().decode(Recipes.self, from: recipeData)
                return recipeDatas
            // 실패
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }
    
    func loadImage(imageUrl: String?, view: UIImageView) {
        guard let urlString = imageUrl, let url = URL(string: urlString) else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard urlString == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                view.image = UIImage(data: data)
            }
        }
    }
    
    func convertToHTTPS(urlString: String) -> String? {
        if var urlComponents = URLComponents(string: urlString) {
            urlComponents.scheme = "https"
            return urlComponents.string
        }
        return nil
    }
}

