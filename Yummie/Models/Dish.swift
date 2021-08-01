//
//  Dish.swift
//  Yummie
//
//  Created by mac on 8/1/21.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
    
    
}
