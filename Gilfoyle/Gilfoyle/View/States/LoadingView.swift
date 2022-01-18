//
//  LoadingView.swift
//  Guru
//
//  Created by Rafael Adolfo  on 01/05/21.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 60, height: 60)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .padding(.all, 195)
            .onAppear() {
                self.isLoading = true
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
