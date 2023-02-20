//
//  Model.swift
//  Services
//
//  Created by Willow on 18.02.2023.
//

import UIKit

// MARK: - VKServices
struct VKServices: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let name, description: String
    let iconURL: String
    let serviceURL: String
    
    enum CodingKeys: String, CodingKey {
            case name, description
            case iconURL = "icon_url"
            case serviceURL = "service_url"
        }
}
// MARK: - Parsing
func ParsingJSON(completed: @escaping ([Item]) -> ()) {
    let API = "https://mobile-olympiad-trajectory.hb.bizmrg.com/semi-final-data.json"
    guard let url = URL(string: API) else{print("Ошибка");return}
    let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data else {return}
        if let ParsingData = try? JSONDecoder().decode(VKServices.self, from: data){
            completed(ParsingData.items)
        }
    }
    dataTask.resume()
}
