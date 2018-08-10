//
//  RestaurantCollectionView.swift
//  ray37_p5
//
//  Created by Raheel Yanful on 4/8/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

class RestaurantCollectionView: UICollectionViewCell{
    
    var imgLabel: UIImageView!
    var nameLabel: UILabel!
    var locationLabel: UILabel!
    var mealLabel: UILabel!
    var typeLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        imgLabel = UIImageView()
        imgLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 22)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationLabel = UILabel()
        locationLabel.font = .systemFont(ofSize: 16)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mealLabel = UILabel()
        mealLabel.font = .systemFont(ofSize: 16)
        mealLabel.translatesAutoresizingMaskIntoConstraints = false
        
        typeLabel = UILabel()
        typeLabel.font = .systemFont(ofSize: 16)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(mealLabel)
        contentView.addSubview(typeLabel)
    }
    
    override func updateConstraints() {
        
        
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            //nameLabel.heightAnchor.constraint(equalToConstant: 18),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            //locationLabel.heightAnchor.constraint(equalToConstant: 22),
            locationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            mealLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            mealLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            //mealLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ])
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: mealLabel.bottomAnchor, constant: 8),
            typeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            //typeLabel.leadingAnchor.constraint(equalTo: mealLabel.trailingAnchor, constant: 16),
            ])
        
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
