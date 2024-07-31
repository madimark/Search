//
//  Business.swift
//  Search
//
//  Created by Madi Muratuly on 28.07.2024.
//

import SwiftUI

struct Business: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let price: String
}

struct BusinessView: View {
    let businesses = [
        Business(imageName: "exampleImage5", title: "Basic title looooooong text of record card", price: "Горы, Лыжи и сноуборд..."),
        Business(imageName: "exampleImage6", title: "Basic title looooooong text of record card", price: "Походы, Сплавы, Спорт"),
        Business(imageName: "exampleImage5", title: "Basic title looooooong text of record card", price: "Горы, Лыжи и сноуборд..."),
        Business(imageName: "exampleImage6", title: "Basic title looooooong text of record card", price: "Походы, Сплавы, Спорт")
        // Add more businesses here
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(businesses) { business in
                    BusinessCard(business: business)
                }
            }
            .padding()
        }
    }
}

struct BusinessCard: View {
    let business: Business

    var body: some View {
        VStack(alignment: .leading) {
            Image(business.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(8)
            
            Text(business.title)
                .font(.custom("Onest-Regular", size: 16))
                .padding(.vertical, 4)
                .foregroundColor(.black)
            
            Text(business.price)
                .font(.custom("Onest-Regular", size: 14))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct BusinessView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}
