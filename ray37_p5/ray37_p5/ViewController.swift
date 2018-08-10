//
//  ViewController.swift
//  ray37_p5
//
//  Created by Raheel Yanful on 4/8/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    var collection: UICollectionView!
    var collectionR: UICollectionView!
    let filterReuseIdentifier = "filterCell"
    let restaurantReuse = "resCell"
    //let footerReuse = "footerView"
    
    let r1 = Restaurant(name: "Dunkin' Donuts", location: "North", meal: "breakfast", type: "fast food")
    let r2 = Restaurant(name: "Chick fil A", location: "West", meal: "dinner", type: "fast food")
    let r3 = Restaurant(name: "Burger King", location: "West", meal: "lunch", type: "fast food")
    let r4 = Restaurant(name: "P.F. Chang's", location: "Central", meal: "dinner", type: "chinese")
    let r5 = Restaurant(name: "Louis's", location: "North", meal: "lunch", type: "food truck")
    let r6 = Restaurant(name: "Poke Bowl", location: "North", meal: "lunch", type: "food truck")
    let r7 = Restaurant(name: "Outback", location: "West", meal: "breakfast", type: "Steakhouse")
    let r8 = Restaurant(name: "Dominoes", location: "Central", meal: "dinner", type: "pizza")
    let r9 = Restaurant(name: "Pizza Hut", location: "Off-campus", meal: "lunch", type: "pizza")
    let r0 = Restaurant(name: "I-HOP", location: "Off-campus", meal: "breakfast", type: "pancake house")
    var res: [Restaurant] =  []
    var all: [Restaurant] =  []
    
    let filters = [Filter(name: "North", section: .location), Filter(name: "West", section: .location), Filter(name: "Central", section: .location), Filter(name: "Off-campus", section: .location), Filter(name: "breakfast", section: .meal), Filter(name: "lunch", section: .meal), Filter(name: "dinner", section: .meal), Filter(name: "fast food", section: .type), Filter(name: "pancake house", section: .type), Filter(name: "chinese", section: .type), Filter(name: "Steakhouse", section: .type), Filter(name: "food truck", section: .type), Filter(name: "pizza", section: .type)]
    var selected: [Filter] = []
    var filtered: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        title = "Food"
        
        all = [r1, r2, r3, r4, r5, r6, r7, r8, r9, r0]
        res = all
        
        let layoutf = UICollectionViewFlowLayout()
        layoutf.scrollDirection = .horizontal
        
        let layoutr = UICollectionViewFlowLayout()
        
        collection = UICollectionView(frame: view.frame, collectionViewLayout: layoutf)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.allowsMultipleSelection = true
        
        collectionR = UICollectionView(frame: view.frame, collectionViewLayout: layoutr)
        collectionR.dataSource = self
        collectionR.delegate = self
        collectionR.backgroundColor = .white
        collectionR.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(FilterCollectionView.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        collectionR.register(RestaurantCollectionView.self, forCellWithReuseIdentifier: restaurantReuse)
        //collection.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuse)
        
        view.addSubview(collection)
        view.addSubview(collectionR)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            collection.heightAnchor.constraint(equalToConstant: 50),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        NSLayoutConstraint.activate([
            collectionR.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 16),
            collectionR.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionR.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionR.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionR{
            let cellR = collectionR.dequeueReusableCell(withReuseIdentifier: restaurantReuse, for: indexPath) as! RestaurantCollectionView
            
            
                cellR.nameLabel.text = res[indexPath.item].name
                cellR.nameLabel.textColor = .white
                cellR.locationLabel.text = res[indexPath.item].location
                cellR.mealLabel.text = res[indexPath.item].meal
                cellR.typeLabel.text = res[indexPath.item].type
                //cellR.imgLabel.image = res[indexPath.item].img
            
            cellR.backgroundColor = UIColor(red:200/255, green: 5/255, blue: 100/255, alpha: 0.15)
            cellR.layer.cornerRadius = 5
            
            cellR.setNeedsUpdateConstraints()
            return cellR
        }
        else {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as! FilterCollectionView
            
        
            cell.filterLabel.text = filters[indexPath.item].name
            cell.filterLabel.textColor = .white
            
            if cell.isSelected == true {
                cell.backgroundColor = .red
            }
            else{
                cell.backgroundColor = UIColor(red:100/255, green: 100/255, blue: 100/255, alpha: 0.15)
            }
            cell.layer.cornerRadius = 5
            cell.setNeedsUpdateConstraints()
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collection{
            return filters.count
        }
        else{
            if filtered.count == 0{
                if selected.count > 0 {
                    return 0
                }
                res = all
                return res.count
            }
            res = filtered
            return filtered.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collection{
            return CGSize(width: view.frame.width/4, height: 45)
        }
        return CGSize(width: 150, height: view.frame.height/5)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collection {
            collectionView.cellForItem(at: indexPath)?.isSelected = true
            
            collectionView.cellForItem(at: indexPath)?.backgroundColor = .red
            
            if !selected.contains(where: {$0.name == currentFil.name}) {
                if selected.count == 0 || selected.contains(where: {$0.section == currentFil.section}) {
                    if !filtered.contains(where: {$0.name == restaurant.name}){
                        
                        for restaurant in all{
                            print("passsed first")
                                if let paths = collection.indexPathsForSelectedItems {
                                    for path in paths{
                                        let currentFil = filters[path.item]
                                        print(currentFil.name)
                                        if currentFil.name == restaurant.location || currentFil.name == restaurant.meal || currentFil.name == restaurant.type{
                                            filtered.append(restaurant)
                                            print("IM HEEEREEE" + restaurant.location)
                                        }
                                    }
                                    
                                            
                            
                            }
                        }
                    }
                }
                else{
                    print("diddddd else")
                    for ind in (-1...filtered.count-1).reversed(){
                        if ind > -1 && currentFil.name != filtered[ind].location && currentFil.name != filtered[ind].meal && currentFil.name != filtered[ind].type{
                            print(ind)
                            print(filtered[ind].name)
                            filtered.remove(at: ind)
                        }
                    }
                }
            }
            selected.append(filters[indexPath.item])
            for i in 0...selected.count-1{
                print("ENDDDDD " + selected[i].name)
            }
            
            res = filtered
            collectionR.reloadData()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let removeAt = selected.index(where: {$0.name == filters[indexPath.item].name}){
            selected.remove(at: removeAt)
            collectionR.reloadData()
        }
        if collectionView == collection {
            collectionView.cellForItem(at: indexPath)?.isSelected = false
            print(filters[indexPath.item].name)
            if filters.count > 0 {
                collectionView.cellForItem(at: indexPath)?.backgroundColor = UIColor(red:100/255, green: 100/255, blue: 100/255, alpha: 0.15)
                for ind in (-1...res.count-1).reversed(){
                    if ind > -1{
                        let currentFil = filters[indexPath.item]
                        if currentFil.name == res[ind].location || currentFil.name == res[ind].meal || currentFil.name == res[ind].type{
                            filtered.remove(at: ind)
                        }
                    }
                }
                if selected.count > 0{
                    if selected.count == filters.count{
                        res = all
                        return
                    }
                    filtered = []
                    for restaurant in all{
                        for fil in selected{
                            if selected.contains(where: {$0.section == fil.section}) || !filtered.contains(where: {$0.name == restaurant.name}) {
                                if fil.name == restaurant.location || fil.name == restaurant.meal || fil.name == restaurant.type{
                                    filtered.append(restaurant)
                                }
                            }
                            else {
                                for ind in (-1...filtered.count-1).reversed(){
                                    if ind > -1 && fil.name != filtered[ind].location && fil.name != filtered[ind].meal && fil.name != filtered[ind].type{
                                        print(ind)
                                        print(filtered[ind].name)
                                        filtered.remove(at: ind)
                                    }
                                }
                            }
                        }
                        
                    }
                }
                print(filtered)
                res = filtered
                collectionR.reloadData()
            }
        }
    }
    

}

