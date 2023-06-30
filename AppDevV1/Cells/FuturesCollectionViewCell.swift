//
//  FuturesCollectionViewCell.swift
//  AppDevV1
//
//  Created by John Sharpe on 4/23/23.


//https://github.com/JNSharpe11/AppDevelopment.git

import UIKit

class FuturesCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseIdentifier = "FuturesCollectionViewCell"
    
    let stockDataSource: [String] = ["Dow", "S&P, NASDAQ"]
    
    
    let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
        
    }()
    
    
    let labelText: UILabel = {
        
        let labelText = UILabel()
        labelText.textAlignment = .left
        labelText.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelText.textColor = .white
        return labelText
        
    }()
    
    let cellView: UICollectionViewCell = {
        
        let cellView = UICollectionViewCell()
        
        return cellView
    }()
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        stackView.addArrangedSubview(labelText)
        stackView.addArrangedSubview(cellView)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0)
        ])
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.backgroundColor = .darkGray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(_ app: App) {
        
        labelText.text = app.futuresLabelText
        
        configureBorder(array: app.futuresBorderValue ?? [0])
    }
    
    func configureBorder(array: [Int]) {
        
        //Index starts at zero, and tracks location in array of ints
        var currentIndex = 0
        
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
           
            
            let thisVal = FuturesBorderType(rawValue: array[currentIndex])
    
            switch thisVal {
                
                case .green:
        
                    self.layer.borderWidth = 4.0
                    self.layer.borderColor = UIColor.green.cgColor
                    break
                
                case .yellow:
                    self.layer.borderWidth = 4.0
                    self.layer.borderColor = UIColor.yellow.cgColor
                    break
                
                case .red:
                    self.layer.borderWidth = 4.0
                    self.layer.borderColor = UIColor.systemRed.cgColor
                    
                    break
                case .none:
                    self.layer.borderWidth = 4.0
                    self.layer.borderColor = UIColor.systemRed.cgColor
                    
                    break
                default:
                    self.layer.borderWidth = 0.0
                    self.layer.borderColor = UIColor.clear.cgColor
                    break
            }
            
            currentIndex += 1
            
            //If at the end, start up and loop through the array 
            if currentIndex == (array.count - 1) {
                
                currentIndex = 0
            }
        }
    }
    
}
