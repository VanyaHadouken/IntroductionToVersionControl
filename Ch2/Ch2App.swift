//
//  Ch2App.swift
//  Ch2
//
//  Created by Ivan Ferrara on 07/11/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var scaleEffect: CGFloat = 0.8
    @State private var opacity: Double = 0.5

    var body: some View {
        if isActive {
            MyBooksView() // Schermata principale
        } else {
            VStack {
                Image("intro") // puoi usare il tuo logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.blue)
            }
            .scaleEffect(scaleEffect)
            .opacity(opacity)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onAppear {
                // Animazione di ingresso
                withAnimation(.easeIn(duration: 1.0)) {
                    self.scaleEffect = 1.0
                    self.opacity = 1.0
                }
                
                // Passa alla schermata principale dopo 2 secondi
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

@main
struct MyBooksApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView() // Avvio dell'app con splash
        }
    }
}

struct Ch2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
