//
//  HomeView.swift
//  Ch2
//
//  Created by Ivan Ferrara on 10/11/25.
//

import SwiftUI

// Example user names
let userNames: [String] = [
    "Ivan Ferrara",
    "Sabrina Bonetti",
    "Gennaro Biagino",
    "Giorgia Minetti",
    "Ciro De Marco",
    "Sahaya Gnanadurai"
]

// MARK: - Home View
struct HomeView: View {
    
    @State private var favorites: Set<String> = []   // ⭐ Set dei preferiti
    
    // Example data
    let books: [Book] = [
        Book(imageName: "reading1", title: "Jin Jiyan Azadi", author: "by Andrea Wolfe Institute", description: "✯ 4.29 (41) · Essay", reviews: ["Osaka, 1956. Three very young authors, little more than boys, churn out page after page for the rental bookstore market and dream of revolutionizing the world of Japanese comics. They admire master Tezuka Osamu, but their manga are aimed at an adult audience: they explore genres such as thriller, noir, realism, and social critique, with stories “without humor and of high dramatic intensity.” Their style is harsh and unsentimental, incorporating cinematic editing techniques and reflecting the anxieties and discomfort of Japanese society still grappling with the wounds of the postwar era. Their names are Matsumoto Masahiko, Tatsumi Yoshihiro, and Saitō Takao. They don’t know it yet, but they are giving birth to *gekiga*: a new way of making comics that will influence entire generations of artists, in Japan and beyond. This is their story, recalled by Matsumoto in a moving, poetic, and adventurous autobiographical manga—a story made of dreams and disappointments, friendships and betrayals, unscrupulous publishers and dusty editorial offices, legendary magazines such as *Kage* and *Machi* forever teetering between success and failure, sleepless nights at the drawing table, arguments, and drinking sessions. Originally serialized in *Big Comic* between 1979 and 1983, *The Gekiga Fanatics* finally arrives in Italy after being translated in the United States, France, and Spain. It is a precious record of a turning point, a firsthand testimony of a key chapter in the history of manga—a necessary book for understanding the roots of a cultural and industrial phenomenon that continues to captivate millions of readers around the world."]),
        Book(imageName: "reading2", title: "Puttane assassine", author: "by Roberto Bolaño", description: "✯ 3.84 (6.730) · Fiction & Literature", reviews: ["Women are murderous whores, Max, they are monkeys shivering with cold, gazing at the horizon from a sick tree, they are princesses searching for you in the darkness, weeping, searching for the words they can never utter. We live and plan our life cycles in ambiguity, says the character (a murderer? a whore? both?) in the story that gives this book its title. Last Sunsets on Earth narrates a trip to Acapulco that gradually becomes a descent into hell. Dentista tells the story of a mysterious teenager and two adults, already in full view of everything, who observe him from the precipice. Buba tells a football story in three parts: that of a South American footballer, that of an African footballer, and that of a Spanish one, and the surprising story of his team, which could very well be Barcelona."]),
        Book(imageName: "reading3", title: "I fanatici del gekiga", author: "by Masahiko Matsumoto", description: "✯ 3.38 (92) · Comics", reviews: ["Osaka, 1956. Three very young authors, little more than boys, churn out page after page for the rental bookstore market and dream of revolutionizing the world of Japanese comics. They admire master Tezuka Osamu, but their manga are aimed at an adult audience: they explore genres such as thriller, noir, realism, and social critique, with stories “without humor and of high dramatic intensity.” Their style is harsh and unsentimental, incorporating cinematic editing techniques and reflecting the anxieties and discomfort of Japanese society still grappling with the wounds of the postwar era. Their names are Matsumoto Masahiko, Tatsumi Yoshihiro, and Saitō Takao. They don’t know it yet, but they are giving birth to *gekiga*: a new way of making comics that will influence entire generations of artists, in Japan and beyond. This is their story, recalled by Matsumoto in a moving, poetic, and adventurous autobiographical manga—a story made of dreams and disappointments, friendships and betrayals, unscrupulous publishers and dusty editorial offices, legendary magazines such as *Kage* and *Machi* forever teetering between success and failure, sleepless nights at the drawing table, arguments, and drinking sessions. Originally serialized in *Big Comic* between 1979 and 1983, *The Gekiga Fanatics* finally arrives in Italy after being translated in the United States, France, and Spain. It is a precious record of a turning point, a firsthand testimony of a key chapter in the history of manga—a necessary book for understanding the roots of a cultural and industrial phenomenon that continues to captivate millions of readers around the world."]),
        Book(imageName: "want1", title: "Figure", author: "by Riccardo Falcinelli", description: "✯ 4.55 (1.493) · Essay", reviews: ["Why do some images become famous and others don't? Why do they capture us, amaze us, hypnotize us? How do they work? Following the resounding success of Cromorama, in this new book, Riccardo Falcinelli takes us into the workshops of painters, photographers, and directors, from Raphael to Stanley Kubrick, revolutionizing our way of seeing. Featuring 500 color images."]),
        Book(imageName: "want2", title: "Il femminismo è per tutti", author: "by Bell Hooks", description: "✯ 4.16 (27.785) · Essay", reviews: ["Acclaimed cultural critic bell hooks offers an open-hearted and welcoming vision of gender, sexuality, and society in this inspiring and accessible volume. In engaging and provocative style, bell hooks introduces a popular theory of feminism rooted in common sense and the wisdom of experience. Hers is a vision of a beloved community that appeals to all those committed to equality, mutual respect, and justice. hooks applies her critical analysis to the most contentious and challenging issues facing feminists today, including reproductive rights, violence, race, class, and work. With her customary insight and unsparing honesty, hooks calls for a feminism free from barriers but rich with rigorous debate. In language both eye-opening and optimistic, hooks encourages us to demand alternatives to patriarchal, racist, and homophobic culture, and to imagine a different future."]),
        Book(imageName: "read3", title: "Tradire i sentimenti", author: "by Franco La Cecla", description: "✯ 3.42 (50) · Essay", reviews: ["In all books where the Fragment reigns supreme, truth and whimsy flow from one end to the other. But how can we distinguish them, how can we know what is conviction and what is whim? An affirmation, born of the moment, precedes or follows another that, a lifelong companion, rises to the dignity of obsession. It is therefore up to the reader to discern, because the author often hesitates to pronounce. In Confessions and Anathemas, a succession of perplexities, one will find questions but no answers. Besides, what answer? If there were one, one would know it, with all due respect to the devotee of wonder. It seems superfluous—if not disrespectful—to add anything to the words with which Cioran himself introduced, in 1987, what would be the last book he published during his lifetime. But perhaps it can be said that this collection of vibrant aphorisms is the worthy seal of a unique work: the quintessence of an unprejudiced metaphysics and the last blaze of a style as imitated as it is inimitable, in which the perfect smoothness of a Frenchman of rare elegance translates perfectly pointed thoughts."])
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    
                    // MARK: Header
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
                    .padding(.top, 10)
                    
                    // MARK: Book Cards
                    ForEach(books.indices, id: \.self) { index in
                        let book = books[index]
                        let userName = userNames[index % userNames.count]
                        
                        // Each book card
                        ZStack(alignment: .topTrailing) {
                            
                            // Background card shape
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(.systemGray6))
                                .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                            
                            // 🔖 Bookmark pulsante
                            Button(action: {
                                if favorites.contains(book.title) {
                                    favorites.remove(book.title)
                                } else {
                                    favorites.insert(book.title)
                                }
                            }) {
                                Image(systemName: favorites.contains(book.title) ? "bookmark.fill" : "bookmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .bold))
                                    .frame(width: 44, height: 44) // HIG touch area
                                    .background(favorites.contains(book.title) ?
                                                Color.pink.opacity(0.90) :
                                                    Color.pink.opacity(0.60))
                                    .clipShape(Circle())
                                    .padding(10)
                            }
                            
                            // Content
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Read by \(userName)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 12)
                                    .padding(.top, 10)
                                    .foregroundColor(.black)
                                
                                HStack(spacing: 15) {
                                    
                                    // Cover image (clickable)
                                    NavigationLink(destination: DetailView(book: book)) {
                                        Image(book.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height:150)
                                            .cornerRadius(10)
                                            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 3)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
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
                                .padding(.horizontal, 12)
                                .padding(.bottom, 12)
                            }
                        }
                        .padding(.horizontal)
                        .frame(height: 200)
                    }
                }
                .padding(.vertical)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
