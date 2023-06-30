//
//  App.swift
//  AppDevV1
//
//  Created by John Sharpe on 4/23/23.
//

import UIKit

enum FuturesBorderType: Int {
    case yellow = 2
    case green = 1
    case red = -1
    case none = 0
}

struct App: Hashable {
    
    //let futureHeadline: String?
    
    //let title: String
   // let subtitle: String
    let price: Double?
    
    let futuresLabelText: String
    
    let futuresBorderValue: [Int]? // -1, 0, or 1
    
    
    /*
    
    var formattedText: String {
        
        if let futureLabelText = futuresLabelText {
            
            guard let textForLabel = FuturesCollectionViewCell.contains(stockNameLabel) else {
                return String(futureLabelText)
            }
            
        }
        
    }
     
     */
    
    var formattedPrice: String {
        
        if let price = price {
            guard let localCurrencyCode = Locale.autoupdatingCurrent.currency?.identifier else {
                
                return String(price)
                
            }
            
            return price.formatted(.currency(code: localCurrencyCode))
        } else {
            return "GET"
        }
        
    }
    
    let color = UIColor.random

    
}
