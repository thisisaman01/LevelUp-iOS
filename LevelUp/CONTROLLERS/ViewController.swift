//
//  ViewController.swift
//  LevelUp
//
//  Created by AMAN K.A on 13/01/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    
    @IBOutlet weak var collectionView:
    UICollectionView!
    
    
    @IBOutlet weak var orangeimage: UIImageView!
    
    @IBOutlet weak var greyimage: UIImageView!
    
    
    @IBOutlet weak var stack1: UIStackView!
    
    @IBOutlet weak var stack2: UIStackView!
    
    @IBOutlet weak var upperview: UIView!
    var CoachesImage: [String] = ["1coach", "2coach", "4coach", "4coach", "5coach"]
    var headingData: [String] = ["Day 1: Steps to Recharge", "Day 2: Steps to Train", "Day 3: Steps to Relax", "Day 4: Steps to Energize", "Day 5: Steps to Balance"]
    var subheadingData: [String] = ["Meditation", "Workout", "Deep Breathing", "Running", "Mindfulness"]
    var coachNameData: [String] = ["Coach: Muskaan", "Coach B", "Coach C", "Coach D", "Coach E"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        orangeimage.layer.cornerRadius = 20.0
        greyimage.layer.cornerRadius = 20.0
        
    
        
    stack1.layer.borderWidth = 1.0
    stack1.layer.borderColor = UIColor.systemBlue.cgColor
        
        upperview.layer.borderWidth = 1.0
        upperview.layer.borderColor = UIColor.systemBlue.cgColor
        
        // Label for stack1
                let label2 = UILabel()
                label2.text = "1090 XP"
                label2.textAlignment = .right
                label2.textColor = .black
                stack2.addArrangedSubview(label2)

                // Label for stack2
        
        // there is some numbering issues stack1 is named as stack2 and vice versa
        
                let label1 = UILabel()
                label1.text = "30 XP to Level:10"
                label1.textAlignment = .right
                label1.textColor = .black
                stack1.addArrangedSubview(label1)
        

        // creating space at right margin
        stack1.addArrangedSubview(label1)
        stack1.layoutMargins.right = 10.0
        stack1.isLayoutMarginsRelativeArrangement = true

        
        

    }
    

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoachesImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
        
        cell.coachimage.image = UIImage(named: CoachesImage[indexPath.row])
        cell.headingLabel.text = headingData[indexPath.row]
        cell.subheadingLabel.text = subheadingData[indexPath.row]
        cell.coachNameLabel.text = coachNameData[indexPath.row]
        
        cell.coachimage.layer.cornerRadius = 15.0
        
        return cell
    }
    
    
}

