//
//  DetailView1 2.swift
//  Ch2
//
//  Created by Ivan Ferrara on 08/11/25.
//
import SwiftUI

struct DetailView: View {
    let book: Book
    @State private var isAdded = false
    @State private var rating: Double = 0
    @State private var showOptions = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image(book.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 300)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                    .padding(.top)
                
                Text(book.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.bottom, -10)
                
                Text(book.author)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(book.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // ⭐️ Stelle per valutazione
                StarRatingView(rating: $rating)
                    .padding(.top, 0)
                
                // Sezione recensioni
                VStack(alignment: .leading, spacing: 10) {
                    Text("From the Publisher")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 5)
                    
                    ForEach(book.reviews, id: \.self) { review in
                        Text(review)
                            .font(.body)
                            .padding(.vertical, 2)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                // ➕ Tasto "aggiungi ai preferiti"
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        isAdded.toggle()
                    }
                } label: {
                    Image(systemName: isAdded ? "bookmark" : "plus")
                        .font(.system(size: 16, weight: .semibold)) // 🔹 leggermente più piccolo
                        .foregroundColor(isAdded ? .pink.opacity(0.90) : .blue)
                        .padding(6) // 🔹 padding ridotto
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                        .shadow(radius: 1)
                        .accessibilityLabel(isAdded ? "Aggiunto" : "Aggiungi")
                }
                .padding(.trailing, -7)
                
                // ⋯ Tasto opzioni orizzontale
                Menu {
                    Button {
                        print("Share")
                    } label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }

                    Button {
                        print("Report a Concern")
                    } label: {
                        Label("Report a Concern", systemImage: "exclamationmark.bubble")
                    }

                    Button {
                            print("Remove...")
                        } label: {
                            Label("Remove...", systemImage: "trash")
                    }
                        .tint(.red)
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                        .shadow(radius: 1)
                        .accessibilityLabel("Opzioni")
                }


                }
            }
        }
    }
#Preview {
    MyBooksView()
}


struct StarRatingView: View {
    @Binding var rating: Double
    
    private let maxRating = 5
    private let starSize: CGFloat = 28
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(1...maxRating, id: \.self) { index in
                let fillLevel = rating - Double(index) + 1
                
                Image(systemName: fillLevel >= 1
                      ? "star.fill"
                      : (fillLevel >= 0.5 ? "star.leadinghalf.filled" : "star"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: starSize, height: starSize)
                    .foregroundColor(.pink.opacity(0.90))
                    .accessibilityLabel("\(index) stelle")
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            if rating == Double(index) - 0.5 {
                                rating = Double(index)
                            } else if rating == Double(index) {
                                rating = Double(index) - 0.5
                            } else {
                                rating = Double(index)
                            }
                        }
                    }
            }
        }
        .frame(minHeight: 44) // conforme a HIG: area di tap >= 44pt
    }
}

#Preview {
    MyBooksView()
}
