//
//  HomeThisService.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/23.
//

import Foundation
import Alamofire

struct HomeThisService {
    static let shared = HomeThisService()
    
    func getHomeThis(completion: @escaping (NetworkResult<Any>) -> Void){
        
        // 요청서 작성
        let dataRequest = AF.request(APIConstants.productThisURL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: ["Content-Type": "application/json"])
        
        
        dataRequest.responseData { dataResponse in
            
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
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        // Decode하는 중... -> 실해파면 pathErr
        guard let decodeData = try? decoder.decode([HomeProductDataModel].self, from: data) else { return .pathErr }
        print(decodeData)
        
        switch statusCode {
        // 200 : 성공한 경우 (isValidData로 데이터 넘겨줌)
        case 200:
            return .success(decodeData)
        // 400 : 요청이 잘못되었다는 경우 .pathErr 리턴
        case 400:
            return .pathErr
        // 500 : 서버 에러
        case 500:
            return .serverErr
        // 기타 : 네트워크 에러
        default:
            return .networkFail
        }
    }
}

