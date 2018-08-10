//
//  File.swift
//  ray37_p5
//
//  Created by Raheel Yanful on 4/11/18.
//  Copyright © 2018 Raheel Yanful. All rights reserved.
//

import Foundation

class Filter{
    
    var name: String
    var section: Type
    
    init(name: String, section: Type) {
        self.name = name
        self.section = section
    }
}

enum Type{
    case location
    case meal
    case type
}
