//
//  LoginDataModel.swift
//  MarketCurly
//
//  Created by κΉνμ on 2021/06/23.
//

import Foundation

// MARK: - LoginDataModel
struct LoginDataModel: Codable {
    let token: String?
    let errors: [Error]?
}

// MARK: - Error
struct Error: Codable {
    let msg: String
}

