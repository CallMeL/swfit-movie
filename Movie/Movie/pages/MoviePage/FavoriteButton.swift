/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A button that acts as a favorites indicator.
*/

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        VStack {
            Button(action: {
                isSet.toggle()
            }) {
                Image(systemName: isSet ? "star.fill" : "star")
                    .foregroundColor(isSet ? Color.yellow : Color.black)
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
