//
//  Tours.swift
//  Search
//
//  Created by Madi Muratuly on 27.07.2024.
//

import SwiftUI

struct Tour: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let price: String
}

struct Tours: View {
    let tours = [
        Tour(imageName: "exampleImage4", title: "Basic title looooooong text of record card", price: "500 ₸"),
        Tour(imageName: "exampleImage4", title: "Basic title looooooong text of record card", price: "500 ₸"),
        Tour(imageName: "exampleImage4", title: "Basic title looooooong text of record card", price: "500 ₸"),
        Tour(imageName: "exampleImage4", title: "Basic title looooooong text of record card", price: "500 ₸")
        // Add more tours here
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(tours) { tour in
                    TourCard(tour: tour)
                }
            }
            .padding()
        }
    }
}

struct TourCard: View {
    let tour: Tour

    var body: some View {
        VStack(alignment: .leading) {
            Image(tour.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(8)
            
            Text(tour.title)
                .font(.custom("Onest-Regular", size: 16))
                .padding(.vertical, 4)
                .foregroundColor(.black)
            
            Text(tour.price)
                .font(.custom("Onest-Regular", size: 14))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct Tours_Previews: PreviewProvider {
    static var previews: some View {
        Services()
    }
}
