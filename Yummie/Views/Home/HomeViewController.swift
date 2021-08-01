//
//  HomeViewController.swift
//  Yummie
//
//  Created by mac on 7/30/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
        .init(id: "id!", name: "African Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 5", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 6", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 7", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 8", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 9", image: "https://picsum.photos/100/200"),
        .init(id: "id!", name: "African Dish 10", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 34.284567),
        .init(id: "id2", name: "Indomie", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 314.289762),
        .init(id: "id3", name: "Pizza", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 343.234567),
        .init(id: "id4", name: "Yam", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 134.2345678),
        .init(id: "id5", name: "Amala", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 3.234568),
        .init(id: "id6", name: "Rice", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 342.234568),
        .init(id: "id7", name: "Beans and plantain", description: "This is a dish of flaked and fried cassava usually enjoyed with milk, sugar and groundnuts. It can also be stirred in hot water for a solid swallow meal served with choice soups all across Nigeria and Africa.", image: "https://picsum.photos/100/200", calories: 434)
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularDishesCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularDishesCollectionView:
            return populars.count
        default:
            return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
            
        case popularDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setUp(dish: populars[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}
