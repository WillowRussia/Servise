//
//  Model.swift
//  Services
//
//  Created by Willow on 18.02.2023.
//

import UIKit

// MARK: - Welcome
struct VKServices: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let name, description: String
    let iconURL: String
    let serviceURL: String
}
