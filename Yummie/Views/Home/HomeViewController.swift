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
    
    override func viewDidLoad() {
        super.viewDidLoad()
            registerCells()
    }

    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularDishesCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        cell.setup(category: categories[indexPath.row])
        return cell
    }
}
