//
//  Restaurant.swift
//  tuto
//
//  Created by Thomas Salandre on 13/05/2020.
//  Copyright © 2020 Thomas Salandre. All rights reserved.
//

import UIKit

class Restaurant {
    
    //MARK: Properties
    
    var name: String
    var photoUrl: String
    
    init?(name: String, photoUrl : String) {
        if name.isEmpty {
               return nil
           }
        self.name = name
        self.photoUrl = photoUrl
    }
    
}
