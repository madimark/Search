//
//  Authors.swift
//  Search
//
//  Created by Madi Muratuly on 26.07.2024.
//

import SwiftUI

struct Author: Identifiable {
    let id = UUID()
    let name: String
    let profession: String
    let profileImage: String
}

struct Authors: View {
    let authors = [
        Author(name: "Annette Black", profession: "Автор", profileImage: "user1"),
        Author(name: "Robert Fox", profession: "Автор", profileImage: "user2"),
        Author(name: "Shymbulak", profession: "Турзона", profileImage: "tourzone1"),
        Author(name: "Annette Black", profession: "Автор", profileImage: "user1"),
        Author(name: "Robert Fox", profession: "Автор", profileImage: "user2"),
        Author(name: "Shymbulak", profession: "Турзона", profileImage: "tourzone1"),
        // Add more authors here
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(authors) { author in
                HStack {
                    Image(author.profileImage)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading) {
                        Text(author.name)
                            .font(.custom("Onest-Regular", size: 16))
                        Text(author.profession)
                            .font(.custom("Onest-Regular", size: 14))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 16)
    }
}

struct Authors_Previews: PreviewProvider {
    static var previews: some View {
        Authors()
    }
}
