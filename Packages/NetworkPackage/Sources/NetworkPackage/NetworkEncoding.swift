//
//  NetworkEncoding.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 01/05/21.
//

import Foundation

public typealias Parameters = [String: Any]

public protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

public enum ParameterEncoding {
    case urlEncoding
    case bodyEncoding

    public func encode(urlRequest: inout URLRequest,
                       parameters: Parameters?) throws {
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = parameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            case .bodyEncoding:
                guard let bodyParameters = parameters else { return }
                try BodyParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            }
        }catch {
            throw error
        }
    }
}
