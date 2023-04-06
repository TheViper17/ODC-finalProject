//
//  APIModel.swift
//  Final Project
//
//  Created by Bishoy Emad Asaad on 04/04/2023.
//

import UIKit


// MARK: - Home Page Categoties collection view

struct MainCategoriesModel : Decodable {
    let data: CategoriesDescription
}

struct CategoriesDescription : Decodable {
    let data: [Description]
}

struct Description : Decodable {
    let id : Int
    let name : String
}

// MARK: - Home Page Categoties Detailes collection view

struct MainCategoriesDescription : Decodable {
    let data : CategoriesDetailes
}

struct CategoriesDetailes : Decodable {
    let data : [DataDescription]
}

struct DataDescription : Decodable {
    let price : Double
    let name : String
    let image : String
}
