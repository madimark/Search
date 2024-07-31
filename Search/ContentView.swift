import SwiftUI

struct ContentView: View {

    @State private var selectedTab: String = "Заметки"
    @State private var searchText: String = ""
    let tabs = ["Заметки", "Авторы", "Услуги", "Туры", "Бизнес"]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Поиск")
                    .font(.custom("Onest-Regular", size: 24))
                    .padding(.leading, 16)
                    .foregroundColor(Color.rgba(28, 28, 30, 0.8))
                Spacer()
            }
            .padding(.top, 16)

            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)

                ScrollView {
                                    VStack(alignment: .leading, spacing: 16) {
                                        SearchBar(searchText: $searchText)
                                            .padding(.horizontal)
                              
                        
                        HStack {
                            ForEach(tabs, id: \.self) { tab in
                                VStack {
                                    Text(tab)
                                        .font(.custom("Onest-Regular", size: 14))
                                        .foregroundColor(tab == selectedTab ? Color.rgba(88, 86, 214, 1) : Color.black)
                                        .padding(.vertical, 8)
                                        .onTapGesture {
                                            selectedTab = tab
                                        }
                                    
                                    if tab == selectedTab {
                                        Rectangle()
                                            .fill(Color.rgba(88, 86, 214, 1))
                                            .frame(height: 3)
                                        
                                    }
                                }
                                
                                .padding(.horizontal, 8)
                                
                            }
                        }
                        .padding(.horizontal)
                        if selectedTab == "Авторы" {
                            Authors()
                            
                        } else if selectedTab == "Заметки" {
                            VStack {
                                // First example post
                                PostView(
                                    author: "Annette Black",
                                    date: "12.12.2024",
                                    title: "Basic title loooooooong text of record card",
                                    description: "I did try to convince myself to ride a gondola in Venice, mostly because my wife wanted the experience...",
                                    imageName: "exampleImage1",
                                    profileImage: "user1",
                                    logo1: "mountain",
                                    logo2: "sign",
                                    logo3: "hiking"
                                )
                                // Second example post
                                PostView(
                                    author: "Robert Fox",
                                    date: "12.12.2024",
                                    title: "Basic title loooooooong text of record card",
                                    description: "I did try to convince myself to ride a gondola in Venice, mostly because my wife wanted the experience...",
                                    imageName: "exampleImage2",
                                    profileImage: "user2",
                                    logo1: "mountain",
                                    logo2: "sign",
                                    logo3: "hiking"
                                )
                            }
                            
                        } else if selectedTab == "Услуги" {
                            Services()
                                .font(.custom("Onest-Regular", size: 24))
                                .padding(.horizontal)
                            
                        } else if selectedTab == "Туры" {
                            Tours()
                                .font(.custom("Onest-Regular", size: 24))
                                .padding(.horizontal)
                            
                        } else if selectedTab == "Бизнес" {
                            BusinessView()
                                .font(.custom("Onest-Regular", size: 24))
                                .padding(.horizontal)
                            
                        }
                    }
                    
                    .padding(.top, 16)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
