//
//  BodyParameterEncoder.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 02/05/21.
//

import Foundation

public struct BodyParameterEncoder: ParameterEncoder {
    // MARK: - Public methods
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL}

        if var _ = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {

            let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
            urlRequest.httpBody = jsonData
        } else {
            throw NetworkError.resolvingFailed
        }

         urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
