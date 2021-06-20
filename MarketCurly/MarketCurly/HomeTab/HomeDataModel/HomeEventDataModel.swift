//
//  HomeEventDataModel.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/23.
//

import Foundation
import UIKit

//struct HomeEventDataModel {
//    var eventImage : [EventImage]
//}
//
//struct EventImage {
//    var eventImageName : UIImage
//}
 
struct HomeEventDataModel: Codable {
    let id: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case img
    }

}

typealias HomeEvent = [HomeEventDataModel]
