//
//  Person.swift
//  project10
//
//  Created by Robin van Meeuwen on 06/09/2021.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }

}
