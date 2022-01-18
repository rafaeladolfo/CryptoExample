//
//  ErrorView.swift
//  Guru
//
//  Created by Rafael Adolfo  on 02/05/21.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(.primary)
        }
        .frame(width: UIScreen.main.bounds.width, height: 450, alignment: .center)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: LocalizationUtil.String.errorOcurred)
    }
}
