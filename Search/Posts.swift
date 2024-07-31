//
//  Posts.swift
//  Search
//
//  Created by Madi Muratuly on 30.07.2024.
//

import SwiftUI

struct PostView: View {
    var author: String
    var date: String
    var title: String
    var description: String
    var imageName: String
    var profileImage: String
    var logo1: String
    var logo2: String
    var logo3: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .cornerRadius(8)
                .clipped()

            HStack(alignment: .top) {
                Image(profileImage)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 40, height: 40)

                VStack(alignment: .leading) {
                    Text(author)
                        .font(.custom("Onest-Regular", size: 16))
                    Text(date)
                        .font(.custom("Onest-Regular", size: 14))
                        .foregroundColor(.gray)
                }

                Spacer()

                HStack(spacing: 10) {
                    Image(logo1)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Image(logo2)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.bottom, 8)

            Text(title)
                .font(.custom("Onest-Regular", size: 18))
            Text(description)
                .font(.custom("Onest-Regular", size: 14))
                .foregroundColor(.gray)

            HStack {
                Button(action: {}) {
                    Image("comment")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.rgba(50, 173, 230, 1))
                }
                Text("999")
                    .foregroundColor(Color.rgba(28, 28, 30, 0.8))
                    .font(.custom("Onest-Regular", size: 14))
                Button(action: {}) {
                    Image("like")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.rgba(255, 45, 85, 1))
                }
                Text("999")
                    .foregroundColor(Color.rgba(28, 28, 30, 0.8))
                    .font(.custom("Onest-Regular", size: 14))
                Spacer()
                Button(action: {}) {
                    Image("share")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.rgba(88, 86, 214, 1))
                }
                Button(action: {}) {
                    Image("save")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.rgba(88, 86, 214, 1))
                }
                Image("view")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.rgba(28, 28, 30, 0.8))
                Text("999")
                    .foregroundColor(Color.rgba(28, 28, 30, 0.8))
                    .font(.custom("Onest-Regular", size: 14))
            }
            .padding(.top, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

extension Color {
    static func rgba(_ red: Double, _ green: Double, _ blue: Double, _ opacity: Double) -> Color {
        return Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: opacity)
    }
}
