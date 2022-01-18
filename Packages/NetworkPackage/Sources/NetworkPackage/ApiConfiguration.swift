//
//  ApiConfiguration.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 01/05/21.
//

import Foundation

var AppNetworkEnvironment : NetworkEnvironment = .production

final class ApiConfiguration {
    // MARK: - Properties
    var production: String = ""
    var test: String = ""
    var development: String = ""

    init() {
        setApiNetwork()
    }

    // MARK: - Private methods
    private func setApiNetwork() {
        production = "https://4guruapi.azurewebsites.net:"
        test = "https://4guruapi.azurewebsites.net:"
        development = "https://4guruapi.azurewebsites.net:"
    }

    // MARK: - Public methods
    func getApiUrl(port: String, defaultPath: String, apiVersion: String?, for networkEnvironment: NetworkEnvironment) -> String {
        let version = apiVersion != nil ? apiVersion! + "/" : ""
        var api = ""

        switch networkEnvironment {
        case .production:
            api = production
        case .test:
            api = test
        case .development:
            api = development
        }

        return api + port + "/" + defaultPath + "/" +  version
    }
}
