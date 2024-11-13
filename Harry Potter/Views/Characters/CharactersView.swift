//
//  CharactersView.swift
//  Harry Potter
//
//  Created by Fatih Can on 13.11.2024.
//

import SwiftUI

struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.isLoading {
                    ProgressView(Strings.loadingText.rawValue)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("\(Strings.errorText.rawValue) \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    let filteredCharacters = viewModel.characters.filter { character in
                        viewModel.searchText.isEmpty || character.name.lowercased().contains(viewModel.searchText.lowercased())
                    }
                    LazyVGrid(columns: viewModel.columns, spacing: 20) {
                        ForEach(filteredCharacters, id: \.id) { character in
                            VStack {
                                Text(character.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                AsyncImage(url: URL(string: character.image)) { phase in
                                    switch phase {
                                    case .empty:
                                        placeholderImage(width: 180, height: 180)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 180, height: 180)
                                            .cornerRadius(10).overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.tussock, lineWidth: 4)
                                            )
                                    case .failure:
                                        placeholderImage(width: 180, height: 180)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .frame(width: 180, height: 180)
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
            }
            .background(Color.clooney)
            .navigationTitle(Strings.charactersTitle.rawValue).foregroundColor(Color.blackPearl)
            .searchable(text: $viewModel.searchText, prompt: Strings.searchCharactersText.rawValue)
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

struct CharactersGridView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}

func placeholderImage(width: CGFloat, height: CGFloat) -> some View {
    Image(systemName: "photo")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: width, height: height)
        .cornerRadius(10).foregroundColor(Color.tussock)
}
