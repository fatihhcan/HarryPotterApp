//
//  CustomSearchBar.swift
//  Harry Potter
//
//  Created by Fatih Can on 13.11.2024.
//

import SwiftUI
import UIKit

struct CustomSearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator

        // Özelleştirme ayarları
        searchBar.placeholder = "Search characters"
        searchBar.searchTextField.backgroundColor = .white // Arka plan rengi
        searchBar.barTintColor = .purple // Çubuğun rengi
        searchBar.searchTextField.tintColor = .purple // İmleç rengi
        searchBar.searchTextField.textColor = .black // Yazı rengi

        // Yuvarlak köşeler
        searchBar.layer.cornerRadius = 10
        searchBar.layer.masksToBounds = true

        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
