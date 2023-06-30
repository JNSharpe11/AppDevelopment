//
//  StandardAppCollectionViewCell.swift
//  AppDevV1
//
//  Created by John Sharpe on 4/25/23.
//

import UIKit

class StandardAppCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifer = "StandardAppCollectionViewCell"
    
    let stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        
        return stackView
        
    }()
    
    let cellView: UICollectionViewCell = {
        
        let cellView = UICollectionViewCell()
        cellView.layer.cornerRadius = 15.0
        cellView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        cellView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        return cellView
        
    }()
    
    let labelText: UILabel = {
        
        let labelText = UILabel()
        labelText.textAlignment = .left
        labelText.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelText.textColor = .white
        return labelText
        
    }()
    
    
    /*
    
    let labelStackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .equalSpacing
        
        return stackView
        
    }()
     
     */
    
    let installButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        return button
        
    }()
    
    let lineView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
        
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        stackView.addArrangedSubview(labelText)
//        stackView.addArrangedSubview(cellView)
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0)
        ])
        
//        self.backgroundColor = UIColor.gray.withAlphaComponent(CGFloat.random(in: 1...100))
        
        
//        stackView.addArrangedSubview(cellView)
//        stackView.addArrangedSubview(installButton)
//
//        addSubview(stackView)
//        addSubview(lineView)
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        lineView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8),
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            lineView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
//            lineView.trailingAnchor.constraint(equalTo: installButton.trailingAnchor),
//            lineView.bottomAnchor.constraint(equalTo: bottomAnchor)
//
//        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func configureCell(_ app: App, hideBottomLine: Bool) {
        stackView.backgroundColor = app.color
        //installButton.setTitleColor(app.formattedPrice, for: .normal)
        lineView.isHidden = hideBottomLine
        labelText.text = app.futuresLabelText
    }
    
    
}
