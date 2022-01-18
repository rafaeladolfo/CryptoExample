//
//  LoadingState.swift
//  Guru
//
//  Created by Rafael Adolfo  on 03/05/21.
//

import Foundation

enum LoadingState {
    case idle
    case loading
    case failed(Error)
    case loaded
}
