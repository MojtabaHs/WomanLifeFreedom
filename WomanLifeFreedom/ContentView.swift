//
//  ContentView.swift
//  WomanLifeFreedom
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 10/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    
    private let columns = Array(repeating:  GridItem(.flexible(), spacing: 0), count: 13)
    private let indices = 0...168
    
    private func color(for index: Int) -> Color {
        switch pattern.components(separatedBy: .whitespacesAndNewlines).filter({!$0.isEmpty})[index] {
        case "W": return .red
        case "L": return .gray
        case "F": return .green
        case "S": return .clear
        default: return .black
        }
    }
    
    private func quote(for index: Int) -> String {
        let quotes = quotes.components(separatedBy: .newlines)
        return quotes[index%quotes.count]
    }
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(indices, id: \.self) { index in
                    Rectangle()
                        .fill(color(for: index))
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture { selectedIndex = index }
                }
            }
            .environment(\.layoutDirection, .leftToRight)
            
            VStack {
                Spacer()
                Text(quote(for: selectedIndex))
                    .animation(.default, value: selectedIndex)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
