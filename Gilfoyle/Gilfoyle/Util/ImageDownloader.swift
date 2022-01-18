//
//  ImageDownloader.swift
//  Gilfoyle
//
//  Created by Rafael Adolfo  on 15/07/21.
//

import Foundation

final class ImageDownloader: ObservableObject {
    var data = Data()
    var state = ImageLoadState.loading

    init(url: String) {
        guard let parsedURL = URL(string: url) else {
            fatalError("Invalid URL: \(url)")
        }

        URLSession.shared.dataTask(with: parsedURL) { data, response, error in
            if let data = data, data.count > 0 {
                self.data = data
                self.state = .success
            } else {
                self.state = .failure
            }

            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }.resume()
    }
}
