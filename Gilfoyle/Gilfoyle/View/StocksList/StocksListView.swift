//
//  StocksListView.swift
//  Gilfoyle
//
//  Created by Rafael Adolfo  on 15/07/21.
//

import SwiftUI
import Kingfisher

struct StocksListView: View {
    @StateObject var viewModel = CryptoStocksViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                switch viewModel.state {
                case .idle:
                    Color.clear.onAppear(perform: viewModel.fetchCryptoStocks)
                case .loading:
                    Color.clear
                case .failed(let error):
                    ErrorView(errorMessage: error)
                case .loaded:
                    NavigationView {
                        ScrollView {
                            LazyVStack {
                                ForEach(0..<viewModel.model.count, id:\.self) { index in
                                    NavigationLink(
                                        destination: StockDetailView(model: $viewModel.model[index]),
                                        label: {
                                            StockItem(model: $viewModel.model[index])
                                        })
                                        .buttonStyle(PlainButtonStyle()).simultaneousGesture(TapGesture().onEnded {
                                            viewModel.timer.upstream.connect().cancel()
                                        })
                                }
                            }
                        }
                        .navigationTitle("Choose your crypto")
                        .onReceive(viewModel.timer, perform: { _ in
                            viewModel.fetchCryptoStocks()
                        })
                    }
                    Spacer()
                }
            }
        }
    }
}

struct StockItem: View {
    @Binding var model: CryptoStock
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: model.iconUrl))
                .clipShape(Circle())
                .frame(width: 25, height: 25)
                .padding(.top, 15)

            VStack(alignment: .leading) {
                Text(model.symbol)
                Text(model.name)
                    .font(.system(size: 10))
            }
            .padding(15)
            Spacer()
            VStack(alignment: .trailing) {
                Text(String(format: "%.02f", locale: Locale.current, model.price))
                Text(String(format: model.percentageOneHour < 0 ? "%.02f" : "+%.02f", model.percentageOneHour) + "%")
                    .font(.system(size: 14))
                    .foregroundColor(model.percentageOneHour < 0 ? .red : .green)
            }
            .padding(15)
        }
        .frame(width: UIScreen.main.bounds.width - 40)
        .padding(.top, 2)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .background(Color(colorScheme == .dark ? .secondarySystemBackground : .systemBackground))
        .cornerRadius(5)
        .shadow(color: colorScheme == .dark ? .clear : Color(.systemGray4),radius: 2, x: 0, y:2)
    }
}
