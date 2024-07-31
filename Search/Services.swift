//
//  Services.swift
//  Search
//
//  Created by Madi Muratuly on 30.07.2024.
//

import SwiftUI

struct Service: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let price: String
}

struct Services: View {
    let services = [
        Service(imageName: "exampleImage3", title: "Basic title looooooong text of record card", price: "500 ₸"),
        Service(imageName: "exampleImage3", title: "Basic title looooooong text of record card", price: "500 ₸"),
        Service(imageName: "exampleImage3", title: "Basic title looooooong text of record card", price: "500 ₸"),
        Service(imageName: "exampleImage3", title: "Basic title looooooong text of record card", price: "500 ₸")
        // Add more services here
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(services) { service in
                    ServiceCard(service: service)
                }
            }
            .padding()
        }
    }
}

struct ServiceCard: View {
    let service: Service

    var body: some View {
        VStack(alignment: .leading) {
            Image(service.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(8)
            
            Text(service.title)
                .font(.custom("Onest-Regular", size: 16))
                .padding(.vertical, 4)
                .foregroundColor(.black)
            
            Text(service.price)
                .font(.custom("Onest-Regular", size: 14))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct Services_Previews: PreviewProvider {
    static var previews: some View {
        Services()
    }
}
