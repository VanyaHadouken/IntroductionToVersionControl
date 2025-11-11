//
//  SeeAllSectionView.swift
//  Ch2
//
//  Created by Ivan Ferrara on 11/11/25.
//


import SwiftUI

// MARK: - SeeAllSectionView
struct SeeAllSectionView: View {
    let section: HorizontalSection
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Titolo della sezione SOLO nello scroll
                Text(section.sectionTitle)
                    .font(.largeTitle)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                // Lista completa dei libri
                ForEach(section.books) { book in
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
        // Non impostiamo .navigationTitle, così il titolo non appare in alto
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct SeeAllSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleBooks = [
            Book(imageName: "reading1", title: "Jin Jiyan Azadi", author: "by Andrea Wolfe Institute", description: "✯ 4.29 (41) · Essay", reviews: []),
            Book(imageName: "reading2", title: "Puttane assassine", author: "by Roberto Bolaño", description: "✯ 3.84 (6.730) · Fiction & Literature", reviews: []),
            Book(imageName: "reading3", title: "I fanatici del gekiga", author: "by Masahiko Matsumoto", description: "✯ 3.38 (92) · Comics", reviews: [])
        ]
        let section = HorizontalSection(sectionTitle: "Reading", books: sampleBooks)
        
        NavigationView {
            SeeAllSectionView(section: section)
        }
    }
}
