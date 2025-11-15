//
//  MyBooksView 2.swift
//  Ch2
//
//  Created by Ivan Ferrara on 12/11/25.
//

import SwiftUI

struct MyBooksView: View {
    
    // Dati di esempio per ogni sezione
    let sections: [HorizontalSection] = [
        HorizontalSection(
            sectionTitle: "Reading",
            books: [
                Book(imageName: "reading1",
                     title: "Jin Jiyan Azadi",
                     author: "by Andrea Wolfe Institute",
                     description: "✯ 4.29 (41) · Essay",
                     reviews: ["Jin, Jiyan, Azadî gathers the voices of twenty Kurdish revolutionaries and composes them in a majestic architecture: through private memoirs, letters, and diary entries, the fighters offer us a profound reflection on a journey that does not begin with the reconquest of Kobanê in 2015 but has roots much deeper than that. For the first time, we discover from the protagonists' perspective the worldview and life choices that led them to lead a war of liberation, as well as a momentous project to transform relationships between women and men, between nations, and between living species. Their proposal for a way out captivates us and destabilizes our cultural norms. Translated by some activists of the Italian Committee of Jineolojî."]),
                Book(imageName: "reading2",
                     title: "Puttane assassine",
                     author: "by Roberto Bolaño",
                     description: "✯ 3.84 (6.730) · Fiction & Literature",
                     reviews: ["Women are murderous whores, Max, they are monkeys shivering with cold, gazing at the horizon from a sick tree, they are princesses searching for you in the darkness, weeping, searching for the words they can never utter. We live and plan our life cycles in ambiguity, says the character (a murderer? a whore? both?) in the story that gives this book its title. Last Sunsets on Earth narrates a trip to Acapulco that gradually becomes a descent into hell. Dentista tells the story of a mysterious teenager and two adults, already in full view of everything, who observe him from the precipice. Buba tells a football story in three parts: that of a South American footballer, that of an African footballer, and that of a Spanish one, and the surprising story of his team, which could very well be Barcelona."]),
                Book(imageName: "reading3",
                     title: "I fanatici del gekiga",
                     author: "by Masahiko Matsumoto",
                     description: "✯ 3.38 (92) · Comics",
                     reviews: ["Osaka, 1956. Three very young authors, little more than boys, churn out page after page for the rental bookstore market and dream of revolutionizing the world of Japanese comics. They admire master Tezuka Osamu, but their manga are aimed at an adult audience: they explore genres such as thriller, noir, realism, and social critique, with stories “without humor and of high dramatic intensity.” Their style is harsh and unsentimental, incorporating cinematic editing techniques and reflecting the anxieties and discomfort of Japanese society still grappling with the wounds of the postwar era. Their names are Matsumoto Masahiko, Tatsumi Yoshihiro, and Saitō Takao. They don’t know it yet, but they are giving birth to *gekiga*: a new way of making comics that will influence entire generations of artists, in Japan and beyond. This is their story, recalled by Matsumoto in a moving, poetic, and adventurous autobiographical manga—a story made of dreams and disappointments, friendships and betrayals, unscrupulous publishers and dusty editorial offices, legendary magazines such as *Kage* and *Machi* forever teetering between success and failure, sleepless nights at the drawing table, arguments, and drinking sessions. Originally serialized in *Big Comic* between 1979 and 1983, *The Gekiga Fanatics* finally arrives in Italy after being translated in the United States, France, and Spain. It is a precious record of a turning point, a firsthand testimony of a key chapter in the history of manga—a necessary book for understanding the roots of a cultural and industrial phenomenon that continues to captivate millions of readers around the world."])
            ]
        ),
        HorizontalSection(
            sectionTitle: "Want to Read",
            books: [
                Book(imageName: "want1",
                     title: "Figure",
                     author: "by Riccardo Falcinelli",
                     description: "✯ 4.55 (1.493) · Essay",
                     reviews: ["Why do some images become famous and others don't? Why do they capture us, amaze us, hypnotize us? How do they work? Following the resounding success of Cromorama, in this new book, Riccardo Falcinelli takes us into the workshops of painters, photographers, and directors, from Raphael to Stanley Kubrick, revolutionizing our way of seeing. Featuring 500 color images."]),
                Book(imageName: "want2",
                     title: "Il femminismo è per tutti",
                     author: "by Bell Hooks",
                     description: "✯ 4.16 (27.785) · Essay",
                     reviews: ["Acclaimed cultural critic bell hooks offers an open-hearted and welcoming vision of gender, sexuality, and society in this inspiring and accessible volume. In engaging and provocative style, bell hooks introduces a popular theory of feminism rooted in common sense and the wisdom of experience. Hers is a vision of a beloved community that appeals to all those committed to equality, mutual respect, and justice. hooks applies her critical analysis to the most contentious and challenging issues facing feminists today, including reproductive rights, violence, race, class, and work. With her customary insight and unsparing honesty, hooks calls for a feminism free from barriers but rich with rigorous debate. In language both eye-opening and optimistic, hooks encourages us to demand alternatives to patriarchal, racist, and homophobic culture, and to imagine a different future."]),
                Book(imageName: "want3",
                     title: "Confessioni e anatemi",
                     author: "by E. M. Cioran",
                     description: "✯ 4.00 (1.902) · Fiction & Literature",
                     reviews: ["In all books where the Fragment reigns supreme, truth and whimsy flow from one end to the other. But how can we distinguish them, how can we know what is conviction and what is whim? An affirmation, born of the moment, precedes or follows another that, a lifelong companion, rises to the dignity of obsession. It is therefore up to the reader to discern, because the author often hesitates to pronounce. In Confessions and Anathemas, a succession of perplexities, one will find questions but no answers. Besides, what answer? If there were one, one would know it, with all due respect to the devotee of wonder. It seems superfluous—if not disrespectful—to add anything to the words with which Cioran himself introduced, in 1987, what would be the last book he published during his lifetime. But perhaps it can be said that this collection of vibrant aphorisms is the worthy seal of a unique work: the quintessence of an unprejudiced metaphysics and the last blaze of a style as imitated as it is inimitable, in which the perfect smoothness of a Frenchman of rare elegance translates perfectly pointed thoughts."])
            ]
        ),
        HorizontalSection(
            sectionTitle: "Read",
            books: [
                Book(imageName: "read1",
                     title: "Amore di seconda mano",
                     author: "by Yamada Murasaki",
                     description: "✯ 3.75 (296) · Comics",
                     reviews: ["In the end, we're all the same…we just want to be smothered like babies against anotherhuman's beating heart. Through a cracked door, heartsick Emi hears a playful growl. Cautiously, she lets her lover in―a wolf of a man wielding a bouquet of roses. His shoulders must have been four inches wider than mine. As I stood behind him, I fantasized about the broadness of his chest and the thickness of his neck...and about becoming his mistress once again. And so their story goes. For a young woman interested in love without the hassle of a traditional relationship, an affair with someone else’s spoiled husband is just what she ordered―until it's time to move on. Then there’s with even less time for married men's shenanigans, she turns her attention to her aging father and the guilt of adultery that has gnawed at his heart for years. Her mother is long dead, yet her memory is enshrined for eternity in their―both father’s and daughter's―mirrored indiscretions. Drawn soon after the critically-acclaimed Talk to My Back , the two stories in Second Hand Love mark the triumphant return of Yamada Murasaki, one of literary manga's most respected feminist voices. Translated by noted historian Ryan Holmberg, this edition includes an interview with the artist from the height of her career in 1985, where her wit and wisdom are on shimmering display."]),
                Book(imageName: "read2",
                     title: "I fantasmi",
                     author: "by Sebastian Perez & Isabella Mazzanti",
                     description: "✯ 4.51 (82) · Picture Book",
                     reviews: ["Avengers, revenants, persecutors, or protectors, ghosts are constant presences in folklore and literature. In this new volume of the Encyclopedia of the Marvelous, young Mai takes us to haunted places around the world, discovering spectres like the Inuit ahkiyyini, Haitian zombies, and Chinese jiāngshī, as well as frighteningly magnetic figures like Rosalia Lombardo or the bride of Braemar Castle. But what are the amulets used to protect us? Are there ghost animals? And what means of transportation? How can we communicate with them? How do they usually dress? What traces do they leave? Where do they live? This book will answer these and many other questions..."]),
                Book(imageName: "read3",
                     title: "Tradire i sentimenti",
                     author: "by Franco La Cecla",
                     description: "✯ 3.42 (50) · Essay",
                     reviews: ["Betraying one's feelings, this beautiful Italian expression, means both that we are often unworthy of our feelings or that we betray them with sugar-coated versions of them; but it also means that our feelings betray us, they spill out of us, we are incapable of containing them. They manifest themselves on their own and stare at us from the outside. They betray us to those around us, strangers and otherwise. The result is blushes, tears, sighs, embarrassment, sweats, shivers, and goosebumps. In short, we become uncomfortable with ourselves. And Franco La Cecla discusses this discomfort in this book, which may cause you some discomfort, an irritation, however fleeting, a feeling of embarrassment."])
            ]
        )
    ]
    
    // MARK: - Corpo della vista
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 25) {
                        
                        // Titolo principale e icona profilo
                        HStack {
                            Text("My Books")
                                .font(.system(size: 28, weight: .bold))
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "person.circle")
                                    .font(.system(size: 30))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        // Sezioni orizzontali con card
                        ForEach(sections) { section in
                            VStack(alignment: .leading, spacing: 10) {
                                
                                // Titolo + See All
                                HStack {
                                    Text(section.sectionTitle)
                                        .font(.title2)
                                        .bold()
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: SeeAllSectionView(section: section)) {
                                        HStack(spacing: 4) {
                                            Text("See All")
                                                .font(.subheadline)
                                                .bold()
                                            Image(systemName: "chevron.right")
                                                .font(.subheadline.bold())
                                        }
                                        .foregroundColor(.blue)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.horizontal)
                                
                                // Card contenente tutti i libri della sezione
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(section.books) { book in
                                            NavigationLink(destination: DetailView(book: book)) {
                                                Image(book.imageName)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 150, height: 200)
                                                    .cornerRadius(15)
                                                    .clipped()
                                            }
                                        }
                                    }
                                    .padding(.leading, 15) // lato sinistro allineato al bordo
                                    .padding(.trailing, 50) // lato destro oltre il bordo
                                    .padding(.vertical, 10)
                                }
                                .background(
                                    Rectangle()
                                        .fill(Color(.systemGray5))
                                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                                )
                            }
                        }
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }

    // MARK: - Modello libro
    struct Book: Identifiable {
        let id = UUID()
        let imageName: String
        let title: String
        let author: String
        let description: String
        let reviews: [String]
    }

    // MARK: - Sezione orizzontale
    struct HorizontalSection: Identifiable {
        let id = UUID()
        let sectionTitle: String
        let books: [Book]
    }
