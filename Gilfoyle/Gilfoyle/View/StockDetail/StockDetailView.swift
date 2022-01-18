//
//  StockDetailView.swift
//  Gilfoyle
//
//  Created by Rafael Adolfo  on 15/07/21.
//

import SwiftUI

struct StockDetailView: View {
    @Binding var model: CryptoStock
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Text("Crypto information")
            StockItem(model: $model)
            Spacer()

            Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("Confirm price alert")
            })

        }
    }
}
//
//struct StockDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StockDetailView(model: Binding<CryptoStock>)
//    }
//}
