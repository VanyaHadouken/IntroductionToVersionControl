//
//  FullSectionView.swift
//  Ch2
//
//  Created by Ivan Ferrara on 12/11/25.
//

import SwiftUI

// MARK: - FullSectionView
struct FullSectionView: View {
    let section: HorizontalSection
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Titolo sezione
                Text(section.sectionTitle)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                // Lista dei libri (mostriamo i primi 5 per esempio)
                ForEach(section.books.prefix(5)) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        HStack(spacing: 15) {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 150)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(book.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .lineLimit(3)
                            }
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationTitle(section.sectionTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}
