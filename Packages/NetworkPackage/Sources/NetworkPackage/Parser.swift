//
//  Parser.swift
//  NetworkPackage
//
//  Created by Rafael Adolfo  on 30/04/21.
//

import Foundation

struct Parser {
    public typealias CompletionType<T> = (Result <T, Error>) -> Void

    func decode<T: Decodable>(of type: T.Type,
                              from data: Data,
                              completion: @escaping CompletionType<T>) {

        do {
            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        }
        catch {
            completion(.failure(DecodeResult.failure))
        }
    }
}

extension Parser {
    // MARK: - Methods for testing purposes
    func getJsonData(_ path: String, completion: (Data?) -> Void) {
        if let fileUrl = Bundle.main.url(forResource: path, withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl, options: [])
                completion(data as Data)
            } catch (let error) {
                print(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
