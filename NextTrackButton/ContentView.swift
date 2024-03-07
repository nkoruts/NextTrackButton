//
//  ContentView.swift
//  NextTrackButton
//
//  Created by Nikita Koruts on 07.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isClicked = false
    
    var body: some View {
        Button {
            withAnimation(.spring(dampingFraction: 0.5)) {
                isClicked.toggle()
            } // completion {} from IOS17 🥲
            
            // 💩💩💩
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                isClicked.toggle()
            }
        } label: {
            HStack(spacing: .zero) {
                PlayImage()
                    .opacity(isClicked ? 1 : 0)
                    .frame(width: isClicked ? Constants.imageSize : 0)
                PlayImage()
                    .frame(width: Constants.imageSize)
                PlayImage()
                    .opacity(isClicked ? 0 : 1)
                    .frame(width: isClicked ? 0 : Constants.imageSize)
            }
        }
    }
}

// MARK: - PlayImage
struct PlayImage: View {
    var body: some View {
        Image(systemName: "play.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.accentColor)
    }
}

// MARK: - Constants
enum Constants {
    static let imageSize: CGFloat = 42
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
