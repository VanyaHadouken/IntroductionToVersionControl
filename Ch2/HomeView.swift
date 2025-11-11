//
//  HomeView.swift
//  Ch2
//
//  Created by Ivan Ferrara on 10/11/25.
//

import SwiftUI

// MARK: - Gallery View
struct HomeView: View {
    var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Titolo e icona sulla stessa linea
                    HStack {
                        Text("Goodreads")
                            .font(.system(size: 28, weight: .bold))
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "person.circle")
                                .font(.system(size: 30))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10) // vicino alla status bar
                    
                    // Contenuti scrollabili
                    ForEach(0..<20) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.7))
                            .frame(height: 200)
                            .overlay(
                                Text("Contenuto \(item + 1)")
                                    .foregroundColor(.white)
                                    .font(.title)
                            )
                            .padding(.horizontal)
                    }
                }
            }
        }
    }

