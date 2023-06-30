//
//  UIColor.swift
//  AppDevV1
//
//  Created by John Sharpe on 4/25/23.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        
        UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
        
    }
    
}
