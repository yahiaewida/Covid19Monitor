//
//  ResponseError.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation


import Foundation

struct ResponseError: Error, Codable{
    var message: String
}

enum ErrorStatusCode : Int{
    case BAD_REQUEST = 400
    case NOT_FOUND = 404
    case REQUEST_TIMEOUT = 408
    case INTERNAL_SERVER_ERROR = 500
    case NO_INTERNET_CONNECTION = 503
    case EMPTY_RESPONSE = 204
    
    var errorMessage : ErrorMessage{
        switch self {
        case .BAD_REQUEST:
            return .BAD_REQUEST
        case .NOT_FOUND:
            return .NOT_FOUND
        case .REQUEST_TIMEOUT:
            return .REQUEST_TIMEOUT
        case .INTERNAL_SERVER_ERROR:
            return .INTERNAL_SERVER_ERROR
        case .NO_INTERNET_CONNECTION:
            return .NO_INTERNET_CONNECTION
        case .EMPTY_RESPONSE:
            return .EMPTY_RESPONSE
        }
    }
}

enum ErrorMessage : String{
    case BAD_REQUEST = "Bad Request"
    case NOT_FOUND = "Not Found"
    case REQUEST_TIMEOUT = "Request Timeout"
    case INTERNAL_SERVER_ERROR = "Internal Server Error"
    case NO_INTERNET_CONNECTION = "No Internet Connection"
    case EMPTY_RESPONSE = "Empty Response"
    case INVALID_RESPONSE = "Invalid Response"
    case UNKNOWN_ERROR = "Unknown Error"
}

