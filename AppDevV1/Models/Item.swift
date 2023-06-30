//
//  Item.swift
//  AppDevV1
//
//  Created by John Sharpe on 4/23/23.
//

import Foundation



enum Item: Hashable {
    
    case app(App)
    case category(StoreCategory)
    
    var app: App? {
        
        if case .app(let app) = self {
            return app
        } else {
            return nil
        }
    }
    
    var category: StoreCategory? {
        if case .category(let category) = self {
            
            return category
        } else {
            return nil
        }
    }
    
    static let futuresApps: [Item] = [
        
        .app(App(price: 3.99, futuresLabelText: "DOW", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "S&P", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "NASDAQ", futuresBorderValue: [-1, 0, 1, 1, 1, 1, 2, 2, 2])),
    ]
    
    
    static let ShortsAndLongsApps: [Item] = [
        
        .app(App(price: 3.99, futuresLabelText: "Short-A", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "Long-A", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "Short-B", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "Long-B", futuresBorderValue: [-1, 0, 1, 2])),
        
    ]
    
    static let BitCoinApps: [Item] = [
        
        .app(App(price: 3.99, futuresLabelText: "BitCoin-A", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "BitCoin-B", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "BitCoin-C", futuresBorderValue: [-1, 0, 1, 2])),
        .app(App(price: 3.99, futuresLabelText: "BitCoin-D", futuresBorderValue: [-1, 0, 1, 2])),
        
    ]
    
}
