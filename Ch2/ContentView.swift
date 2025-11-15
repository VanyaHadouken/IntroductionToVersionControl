//
//  MyBooksView.swift
//  Ch2
//
//  Created by Ivan Ferrara on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var previousTab: Tab = .discovery
    @State private var showSearch: Bool = false
    @Namespace private var animation

    @State private var showSplash: Bool = true
    @State private var splashScale: CGFloat = 0.8
    @State private var splashOpacity: Double = 0.5

    // Tutti i libri di MyBooksView (piatto da tutte le sezioni)
    private var allBooks: [Book] {
        MyBooksView().sections.flatMap { $0.books }
    }

    var body: some View {
        ZStack {
            // MARK: - Main TabView
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(Tab.home)

                MyBooksView()
                    .tabItem {
                        Image(systemName: "book.closed.fill")
                        Text("My Books")
                    }
                    .tag(Tab.books)

                SettingsView()
                    .tabItem {
                        Image(systemName: "compass.drawing")
                        Text("Discovery")
                    }
                    .tag(Tab.discovery)

                Color.clear
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(Tab.search)
            }

            // MARK: - Search Overlay
            if showSearch {
                SearchOverlay(
                    showSearch: $showSearch,
                    animation: animation,
                    allBooks: allBooks,
                    onCancel: {
                        withAnimation {
                            selectedTab = previousTab
                            showSearch = false
                        }
                    }
                )
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .zIndex(2)
            }

            // MARK: - Splash Overlay
            if showSplash {
                VStack {
                    Image("intro") // Logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .foregroundColor(.blue)
                }
                .scaleEffect(splashScale)
                .opacity(splashOpacity)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .onAppear {
                    // Animazione di ingresso
                    withAnimation(.easeIn(duration: 1.0)) {
                        splashScale = 1.0
                        splashOpacity = 1.0
                    }
                    // Nascondi splash dopo 2 secondi
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            showSplash = false
                        }
                    }
                }
                .zIndex(3)
            }
        }
        .onChange(of: selectedTab) { newTab in
            if newTab == .search && !showSearch {
                previousTab = selectedTab != .search ? selectedTab : previousTab
                withAnimation {
                    showSearch = true
                }
            }
        }
    }
}

// Enum Tab
enum Tab {
    case home, books, discovery, search
}

// MARK: - Search Overlay
struct SearchOverlay: View {
    @Binding var showSearch: Bool
    var animation: Namespace.ID
    var allBooks: [Book]
    var onCancel: () -> Void

    @State private var query: String = ""
    @FocusState private var isFocused: Bool

    var filteredBooks: [Book] {
        if query.isEmpty { return [] }
        return allBooks.filter {
            $0.title.lowercased().contains(query.lowercased()) ||
            $0.author.lowercased().contains(query.lowercased())
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search...", text: $query)
                            .textFieldStyle(PlainTextFieldStyle())
                            .focused($isFocused)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    isFocused = true
                                }
                            }
                        if !query.isEmpty {
                            Button(action: { query = ""; isFocused = true }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    .padding(10)
                    .background(Color(.systemGray5))
                    .cornerRadius(12)

                    Button("Cancel") {
                        UIApplication.shared.dismissKeyboard()
                        onCancel()
                    }
                    .foregroundColor(.accentColor)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                .padding()

                List(filteredBooks) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        HStack(spacing: 12) {
                            Image(book.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 75)
                                .cornerRadius(6)
                                .shadow(radius: 2)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .background(Color(.systemBackground).ignoresSafeArea())
        }
    }
}

// Helper dismiss tastiera
extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
