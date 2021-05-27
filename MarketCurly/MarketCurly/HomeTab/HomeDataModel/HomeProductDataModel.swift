//
//  HomeProductDataModel.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/27.
//

import Foundation
import UIKit

struct HomeProductDataModel {
    let title : String
    let product : [Product]
}

struct Product {
    let productImage : UIImage
    let productName : String
    let productSale : String
    let productPrice : String
}
