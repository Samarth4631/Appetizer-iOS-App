//
//  XDismissButton.swift
//  Appetizers
//
//  Created by samarth srivastava  on 03/10/26.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 44, height: 44)

            Image(systemName: "xmark")
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .medium))
        }
    }
}

#Preview {
    XDismissButton()
}
