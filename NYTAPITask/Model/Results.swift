//
//  Results.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 05/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import Foundation

struct Model: Codable {
    var results : [Results]
}

struct Results: Codable {
    var title: String?
    var abstract: String?
    var url : String?    
}

