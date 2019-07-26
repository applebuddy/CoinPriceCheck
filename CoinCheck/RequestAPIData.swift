//
//  RequestAPIData.swift
//  CoinCheck
//
//  Created by MinKyeongTae on 26/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import Foundation
import Alamofire

final class RequestAPI {
    static let shared = RequestAPI()
    
    static func requestCurrencyData(urlString: String, completion: @escaping (CurrencyDataResponse) -> Void) {
        let URL = urlString
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { response in
            
            switch response.result {
            // 서버 연결 성공
            case .success:
                if let value = response.result.value {
                    let decoder = JSONDecoder()
                    do {
                        let currencyData = try decoder.decode(CurrencyDataResponse.self, from: value)
                        completion(currencyData)
                    } catch {
                        /* catch 문으로 오게 될 시 대부분 제대로 디코딩이 이루어지지 못한 상황입니다.
                         보통 codable 실수가 대부분입니다.
                         변수명이 틀렸거나 타입 값이 일치하지 않거나 nil값 처리를 제대로 하지 않은 이유가 가장 큽니다.
                         */
                        print("currencyData Variable Error")
                    }
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
