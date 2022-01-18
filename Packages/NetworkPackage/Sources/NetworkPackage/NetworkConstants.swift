//
//  NetworkConstants.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 01/05/21.
//

import Foundation

public enum HTTPMethod: String {
   case get = "GET"
   case post = "POST"
   case put = "PUT"
   case patch = "PATCH"
   case delete = "DELETE"
}

public enum HTTPTask {
   case request
   case requestParameters(bodyEncoding: ParameterEncoding, parameters: Parameters?)
}

public enum RequestResult<String>{
   case success
   case failure(String)
}

public enum NetworkEnvironment {
    case development
    case test
    case production
}
