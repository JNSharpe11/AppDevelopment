//
//  CollectionViewCell.swift
//  AppDevV1
//
//  Created by John Sharpe on 6/4/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var testNameLabel: UILabel!
    
    func configure(with testName: String) {
        
        testNameLabel.text = testName
        
    }
    
}
