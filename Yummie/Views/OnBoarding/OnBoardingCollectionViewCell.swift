//
//  OnBoardingCollectionViewCell.swift
//  Yummie
//
//  Created by mac on 7/30/21.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setUp(_ slide: OnBoardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
