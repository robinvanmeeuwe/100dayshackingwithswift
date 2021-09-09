//
//  ViewController.swift
//  project12
//
//  Created by Robin van Meeuwen on 09/09/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        defaults.set(25, forKey: "age")
        defaults.set(true, forKey: "UseFaceID")
        defaults.set(CGFloat.pi, forKey: "pi")
        
        defaults.set("Robin van Meeuwen", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["hello", " wereld"]
        defaults.set(array, forKey: "SavedArray")
        
        let dict = ["name": "paul", "country": "UK"]
        defaults.set(dict, forKey: "savedDictionary")
        
        let savedInteger = defaults.integer(forKey: "age")
        let savedBoolean = defaults.bool(forKey: "UseFaceID")
//        let savedCGFloat = defaults.CGFloat(forKey: "pi")
        let savedString = defaults.string(forKey: "Name")
        let savedDate = defaults.data(forKey: "LastRun")
        
        let savedArray = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
        let savedDict = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()

        
    }


}

