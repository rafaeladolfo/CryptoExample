//
//  NetworkPackageEndPoint.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 01/05/21.
//

import Foundation

//MARK: API paths alias
public enum GuruEndPoint {
    case fetchStories
    case fetchCryptoStocks
}

//MARK: API endpoints paths
public enum GuruServicePath {
    static let fetchStories = "stories"
    static let fetchCryptoStocks = "crypto/latest"
}

extension GuruEndPoint: EndPointType {
    // MARK: - Endpoint setup
    public var apiPort: String {
        return "443"
    }

    public var apiDefaultPath: String {
        return "api"
    }

    public var apiVersion: String? {
        return nil
    }

    public var task: HTTPTask {
        switch self {
        case .fetchStories:
            return .requestParameters(bodyEncoding: .bodyEncoding, parameters: nil)
        case .fetchCryptoStocks:
            return .requestParameters(bodyEncoding: .bodyEncoding, parameters: nil)
        }
    }

    public var environmentUrl: String {
        return ApiConfiguration().getApiUrl(port: apiPort, defaultPath: apiDefaultPath, apiVersion: apiVersion, for: AppNetworkEnvironment)
    }

    public var baseURL: URL {
        guard let url = URL(string: environmentUrl) else { fatalError("baseURL could not be configured.")}
        return url
    }

    public var path: String {
        switch self {
        case .fetchStories:
            return GuruServicePath.fetchStories
        case .fetchCryptoStocks:
            return GuruServicePath.fetchCryptoStocks
        }
    }

    public var httpMethod: HTTPMethod {
        switch self {
        case .fetchStories:
            return .get
        case .fetchCryptoStocks:
            return .get
        }
    }
}
