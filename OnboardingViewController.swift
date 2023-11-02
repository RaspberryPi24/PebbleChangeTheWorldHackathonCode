//
//  OnboardingViewController.swift
//  PureFindr.
//
//  Created by Franco Pieri on 4/3/23.
//

/*import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var nextBtn: UIButton!
    
    @IBOutlet var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    slides = [
        OnboardingSlide(title: "Promote", description: "Become a daily user and help promote new pet rescue organizations.", image: #imageLiteral(resourceName: "man-removebg-preview__1_-removebg-preview")),
        OnboardingSlide(title: "Support", description: "Begin supporting the new organizations making change possible by donation or volunteering.", image: #imageLiteral(resourceName: "Screenshot_2023-04-04_at_6.03.41_PM-removebg-preview.png")),
        OnboardingSlide(title: "Begin", description: "Begin your journey as a new rescue organization and browse facilities and commodities to what's right for you. ", image: #imageLiteral(resourceName: "finishguy-removebg-preview"))
    ]
        
        // Register the OnboardingCollectionViewCell with the collectionView
        collectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }

    @IBAction func nextBtnClicked(_ sender: UIButton) {
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return slides.count
}
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
}*/

