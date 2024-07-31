import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @State private var isEditing = false
    @State private var searchHistory: [String] = UserDefaults.standard.stringArray(forKey: "SearchHistory") ?? []

    
    
//ScrollView {
//VStack(alignment: .leading, spacing: 16) {
//TextField("Найти в MeGo", text: .constant(""))
//.padding()
//.background(Color.white)
//.cornerRadius(8)
//.overlay(RoundedRectangle(cornerRadius: 8)
//.stroke(Color.rgba(88, 86, 214, 0.6), lineWidth: 1))
//.padding(.horizontal)
//.font(.custom("Onest-Regular", size: 16))
//
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                TextField("Найти в MeGo", text: $searchText, onEditingChanged: { isEditing in
                    self.isEditing = isEditing
                }, onCommit: {
                    self.addSearchHistory()
                })
       
                .padding(7)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.rgba(88, 86, 214, 0.6), lineWidth: 1))
                .padding(.horizontal)
                .font(.custom("Onest-Regular", size: 16))
//                .padding(7)
//                .padding(.horizontal, 25)
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.searchText = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }

            if isEditing && !searchHistory.isEmpty {
                VStack(alignment: .leading) {
                    Text("История")
                        .font(.headline)
                        .padding(.leading, 16)
                        .padding(.top, 8)

                    ForEach(searchHistory, id: \.self) { history in
                        Text(history)
                            .padding(.leading, 16)
                            .padding(.vertical, 4)
                            .onTapGesture {
                                self.searchText = history
                                self.isEditing = false
                            }
                    }
                }
                .background(Color.white)
            }
        }
    }

    private func addSearchHistory() {
        if !searchText.isEmpty && !searchHistory.contains(searchText) {
            searchHistory.append(searchText)
            if searchHistory.count > 5 { // Limit history to the last 5 searches
                searchHistory.removeFirst()
            }
            UserDefaults.standard.set(searchHistory, forKey: "SearchHistory")
        }
    }
}
