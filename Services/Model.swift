//
//  Model.swift
//  Services
//
//  Created by Willow on 18.02.2023.
//

import UIKit

struct VKServices: Decodable {
    let items: [Items]
}
struct Items: Decodable {
    let name: String
    let description: String
    let icon_url: String
    let service_url: Int
}

