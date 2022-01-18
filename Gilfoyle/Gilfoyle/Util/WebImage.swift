//
//  WebImage.swift
//  Guru
//
//  Created by Rafael Adolfo  on 30/04/21.
//


import SwiftUI

public enum ImageLoadState {
    case loading, success, failure
}

struct WebImage: View {
    @StateObject private var loader: ImageDownloader
    var loading: Image
    var failure: Image

    var body: some View {
        setImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "icloud.and.arrow.down.fill"), failure: Image = Image(systemName: "xmark.octagon")) {
        _loader = StateObject(wrappedValue: ImageDownloader(url: url))        
        self.loading = loading
        self.failure = failure
    }

    private func setImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
