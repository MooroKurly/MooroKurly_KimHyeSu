//
//  HomeProductDataModel.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/27.
//

import Foundation
import UIKit

//struct HomeProductDataModel {
//    let title : String
//    let product : [Product]
//}
//
//struct Product {
//    let productImage : UIImage
//    let productName : String
//    let productSale : String
//    let productPrice : String
//}

import Foundation

// MARK: - WelcomeElement
struct HomeProductDataModel: Codable {
    let id: String
    let thumbnail: String
    let store, title, subtitle: String
    let price, discount: Int
    let category: String
    let v: Int
    let bargain: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case thumbnail, store, title, subtitle, price, discount, category
        case v = "__v"
        case bargain
    }
}

typealias HomeProductThisList = [HomeProductDataModel]
