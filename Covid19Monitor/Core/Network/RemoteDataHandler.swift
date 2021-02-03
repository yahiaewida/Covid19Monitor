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
        
        if Connectivity.isConnected() {
            AF.request(urlString, method: methodType ,parameters: parameters)
                .responseJSON(completionHandler: { [weak self] (response) in
                    guard let self = self else { return }
                    
                    if let data = response.data {
                        if response.response?.statusCode == 200 {
                            self.decodeObject(resultSubject: resultSubject, data: data)
                        } else {
                            resultSubject.send(completion: .failure(self.getStatusErrorMessage(statusCode: response.response?.statusCode ?? -1)))
                        }
                    }
                    else {
                        guard case let .failure(error) = response.result else{return}
                        resultSubject.send(completion: .failure(ResponseError(message: error.localizedDescription)))
                    }
                })
        } else {
            resultSubject.send(completion: .failure(ResponseError(message: ErrorMessage.NO_INTERNET_CONNECTION.rawValue)))
        }
        return resultSubject
    }
    
    private func decodeObject<T:Codable>(resultSubject: PassthroughSubject<T,ResponseError>, data: Data) {
        do{
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            resultSubject.send(result)
        }catch{
            resultSubject.send(completion: .failure(ResponseError(message: ErrorMessage.INVALID_RESPONSE.rawValue)))
        }
    }
    
    private func getStatusErrorMessage(statusCode: Int) -> ResponseError{
        let errorStatus = ErrorStatusCode.init(rawValue: statusCode )
        return ResponseError(message:errorStatus?.errorMessage.rawValue ?? "Wrong Status Code :\(statusCode)")
    }
}
