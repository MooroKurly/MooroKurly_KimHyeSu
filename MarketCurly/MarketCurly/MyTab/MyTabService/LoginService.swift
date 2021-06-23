//
//  LoginService.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/23.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService()
    
    private func makeParameter(id: String, pw: String) -> Parameters{
        return ["id" : id
                , "pw" : pw]
    }
    
    func login(id : String,
               pw : String,
               completion : @escaping (NetworkResult<Any>)-> Void) {
        
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .post,
                                     parameters: makeParameter(id: id, pw: pw),
                                     encoding: JSONEncoding.default,
                                     headers : ["Context-type": "application/json"])
        
        dataRequest.responseData { dataResponse in
            dump(dataResponse)
            
            switch dataResponse.result {
            case .success:
                
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                
                completion(.pathErr)
            }
            
            
        }
        
    }
    
    func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(LoginDataModel.self, from: data) else {
            return .pathErr
        }
        
        switch statusCode {
        case 200: return .success(decodedData.token!)
        case 400: return .requestErr(decodedData.errors!)
        case 500: return .serverErr
        default:
            return .networkFail
        }
    }
}
