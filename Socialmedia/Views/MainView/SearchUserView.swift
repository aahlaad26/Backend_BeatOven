//
//  SearchUserView.swift
//  Overall_Backend
//
//  Created by user4 on 03/03/24.
//


import SwiftUI
import Firebase
import FirebaseFirestore
struct SearchUserView: View {
    //view properties
    @State private var fetchedUsers: [User] = []
    @State private var searchText: String = ""
    @State private var posts : [Post] = []
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(fetchedUsers){
                    user in
                    NavigationLink{
                        ReusableProfileContent(posts: $posts, user: user)
                    }label: {
                        Text(user.username)
                            .font(.callout)
                            .hAlign(.leading)
                    }
                    
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Search User")
                .searchable(text: $searchText)
                .onSubmit(of: .search, {
                    Task{await searchUsers()}
                })
                .onChange(of: searchText, perform:{
                    newValue in
                    if newValue.isEmpty{
                        fetchedUsers = []
                        
                    }
                })
                .background(Color("bg-color"))
                .scrollContentBackground(.hidden)
        }
                
        
    }
    func searchUsers()async{
        do{
//            let querylowerCased = searchText.lowercased()
//            let queryupperCased = searchText.uppercased()
            let documents = try await Firestore.firestore().collection("Users").whereField("username", isGreaterThanOrEqualTo:searchText)
                .whereField("username", isLessThanOrEqualTo: "\(searchText)\u{f8ff}")
                .getDocuments()
            
            let users = try documents.documents.compactMap{doc -> User? in
                try doc.data(as: User.self)
            }
            //ui on mainthread
            
            await MainActor.run(body: {
                fetchedUsers = users
            })
            
        }catch{
            print(error.localizedDescription)
        }
    }
}

#Preview {
    SearchUserView()
}
