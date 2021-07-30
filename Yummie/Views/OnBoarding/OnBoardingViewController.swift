//
//  ViewController.swift
//  Yummie
//
//  Created by mac on 7/30/21.
//

import UIKit

class OnBoardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnBoardingSlide] = []
    var currentPage =  0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started!", for: .normal)
            } else {
            nextButton.setTitle("Next", for: .normal)
              
        }
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        slides = [
            OnBoardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnBoardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnBoardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
       
        onBoardingCollectionView.delegate = self
        onBoardingCollectionView.dataSource = self
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNavigationController") as! UINavigationController
            
            controller.modalTransitionStyle = .partialCurl
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
        } else {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        onBoardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setUp(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)  {
            super.viewWillTransition(to: size, with: coordinator)
            onBoardingCollectionView.collectionViewLayout.invalidateLayout()
    }
}


