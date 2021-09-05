//
//  Petition.swift
//  Project7
//
//  Created by Robin van Meeuwen on 05/08/2021.

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
