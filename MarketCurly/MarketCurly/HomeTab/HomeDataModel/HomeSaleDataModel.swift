//
//  HomeSaleDataModel.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/31.
//

import Foundation
import UIKit

struct HomeSaleDataModel {
    let title : String
    let subtitle : String
    let dailySale : [DailySale]
    
}

struct DailySale {
    let dailySaleImage : UIImage
    let dailySaleTitle : String
    let dailySalePercent : String
    let dailySalePrice : String
    let dailyTime : String
    
}
