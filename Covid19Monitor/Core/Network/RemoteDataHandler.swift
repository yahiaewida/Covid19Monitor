//
//  RemoteDataHandler.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//
import Foundation
import Combine
import Alamofire

class RemoteDataHandler{
    
    func request<T : Codable>(uri: String, methodType : HTTPMethod = .get ,parameters: [String : Any]? = ["":""], headers: [String : String]? = ["":""]) -> PassthroughSubject<T,ResponseError>{
        
        let resultSubject = PassthroughSubject<T,ResponseError>()
        var urlString = Urls.BASE_URL
        urlString.append(uri)
        
        //if Connectivity.isConnected() {
            let dataRequest = AF.request(urlString, method: methodType ,parameters: parameters)
            dataRequest.responseJSON(completionHandler: {(response) in
                if let data = response.data{
                    let decoder = JSONDecoder()
                    if response.response?.statusCode == 200 {
                        do{
                            let result = try decoder.decode(T.self, from: data)
                            resultSubject.send(result)
                        }catch{
                            resultSubject.send(completion: .failure(ResponseError(message: ErrorMessage.INVALID_RESPONSE.rawValue)))
                        }
                    }else{
                        let errorStatus = ErrorStatusCode.init(rawValue: response.response?.statusCode ?? -1)
                        resultSubject.send(completion: .failure(ResponseError(message:errorStatus?.errorMessage.rawValue ?? "Wrong Status Code :\(response.response?.statusCode ?? -1)")))
                    }
                }
                else{
                    guard case let .failure(error) = response.result else{return}
                    resultSubject.send(completion: .failure(ResponseError(message: error.localizedDescription)))
                }
            })
//        } else {
//            resultSubject.send(completion: .failure(ResponseError(message: ErrorMessage.NO_INTERNET_CONNECTION.rawValue)))
//        }
        return resultSubject
    }
}


//extension Dictionary where Key == String, Value == String {
//    func toHtppHeaders() -> [HTTPHeaders] {
//        var httpHeaders = [HTTPHeaders]()
//
//        self.forEach { key, value in
//            if !key.isEmpty && !value.isEmpty {
//                httpHeaders.append(HTTPHeader(name: key, value: value)
//            }
//        }
//
//        return httpHeaders
//    }
//}
