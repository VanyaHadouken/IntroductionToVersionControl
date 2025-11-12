//
//  MyBooksView.swift
//  Ch2
//
//  Created by Ivan Ferrara on 07/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @State private var previousTab: Tab = .discovery  // tab attuale prima di aprire search
    @State private var showSearch: Bool = false
    @Namespace private var animation

    var body: some View {
        ZStack {
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

                // Search come tab
                Color.clear
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(Tab.search)
            }

            // Overlay di ricerca sopra tutto
            if showSearch {
                SearchOverlay(
                    showSearch: $showSearch,
                    animation: animation,
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
        }
        .onChange(of: selectedTab) { newTab in
            // Se clicchi Search, salva la tab precedente e mostra overlay
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
    var onCancel: () -> Void

    @State private var query: String = ""
    @FocusState private var isFocused: Bool

    var body: some View {
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

                    // Pulsante X: cancella testo e mantiene tastiera
                    if !query.isEmpty {
                        Button(action: {
                            query = ""
                            isFocused = true
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                        }
                    }
                }
                .padding(10)
                .background(Color(.systemGray5))
                .cornerRadius(12)

                // Pulsante Cancel: chiude overlay e torna alla tab precedente
                Button("Cancel") {
                    UIApplication.shared.dismissKeyboard()
                    onCancel()
                }
                .foregroundColor(.accentColor)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            .padding()

            Spacer()
        }
        .background(Color(.systemBackground).ignoresSafeArea())
    }
}


// MARK: - Helper dismiss tastiera
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
