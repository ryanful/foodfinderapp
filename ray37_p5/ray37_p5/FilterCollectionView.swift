//
//  FilterCollectionView.swift
//  ray37_p5
//
//  Created by Raheel Yanful on 4/8/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

class FilterCollectionView: UICollectionViewCell{
    
    var filterLabel: UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        filterLabel = UILabel()
        filterLabel.font = UIFont.systemFont(ofSize: 15)
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(filterLabel)
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            filterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            filterLabel.heightAnchor.constraint(equalToConstant: 18),
            filterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
        

        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

