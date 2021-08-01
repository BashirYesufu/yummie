//
//  Dish.swift
//  Yummie
//
//  Created by mac on 8/1/21.
//

import Foundation

struct Dish {
    let id, name, description, image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%2f", calories ?? 0)
    }
    
    
}
