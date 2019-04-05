//
//  Results.swift
//  NYTAPITask
//
//  Created by Nikhil Patil on 05/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let status, copyright, section: String
    let lastUpdated: Date
    let numResults: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

struct Result: Codable {
    let section: String
    let subsection: Subsection
    let title, abstract: String
    let url: String
    let byline: String
    let itemType: ItemType
    let updatedDate, createdDate, publishedDate: Date
    let materialTypeFacet, kicker: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let multimedia: [Multimedia]
    let shortURL: String
    
    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
}

struct Multimedia: Codable {
    let url: String
    let format: Format
    let height, width: Int
    let type: TypeEnum
    let subtype: Subtype
    let caption, copyright: String
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum TypeEnum: String, Codable {
    case image = "image"
}

enum Subsection: String, Codable {
    case empty = ""
    case europe = "Europe"
}
