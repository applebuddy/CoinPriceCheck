//
//  RequestAPIData.swift
//  CoinCheck
//
//  Created by MinKyeongTae on 26/07/2019.
//  Copyright © 2019 Min Kyeong Tae. All rights reserved.
//

import Alamofire
import Foundation

enum APIType: String {
    case currencyData
    case tradeData
}

final class RequestAPI {
    static let shared = RequestAPI()

    static func requestCurrencyData<T: Decodable>(urlString: String, returnType _: T.Type, requestType: APIType, completion: @escaping (T) -> Void) {
        let URL = urlString

        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { response in

            switch response.result {
            // 서버 연결 성공
            case .success:
                if let value = response.result.value {
                    let decoder = JSONDecoder()
                    do {
                        switch requestType {
                        case .currencyData:
                            let currencyData = try decoder.decode(T.self, from: value)
                            completion(currencyData)
                        case .tradeData:
                            let tradeData = try decoder.decode(T.self, from: value)
                            completion(tradeData)
                        }

                    } catch {
                        /* catch 문으로 오게 될 시 대부분 제대로 디코딩이 이루어지지 못한 상황입니다.
                         보통 codable 실수가 대부분입니다.
                         변수명이 틀렸거나 타입 값이 일치하지 않거나 nil값 처리를 제대로 하지 않은 이유가 가장 큽니다.
                         */
                        print("currencyData Variable Error: \(error.localizedDescription)")
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

// * MARK: 예외처리 catch 종류 *
//
//        catch let DecodingError.dataCorrupted(context) {
//            presentAlertViewController(errorString: "\(context)")
//        } catch let DecodingError.keyNotFound(key, context) {
//            presentAlertViewController(errorString: "key: \(key), context: \(context)")
//        } catch let DecodingError.valueNotFound(_, context) {
//            presentAlertViewController(errorString: "\(context)")
//        } catch DecodingError.typeMismatch(let type, let context) {
//            self.presentAlertViewController(errorString: "Type, \(type) Mismatched : \(context)")
//        } catch {
//            self.presentAlertViewController(errorString: "\(error.localizedDescription)")
//        }
