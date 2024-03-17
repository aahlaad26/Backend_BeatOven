//
//  MainView.swift
//  Overall_Backend
//
//  Created by user4 on 03/03/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
     init() {
         UITabBar.appearance().backgroundColor = UIColor(Color("button-color"))
         UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray)
         UITabBar.appearance().barTintColor = UIColor(Color("button-color"))
     }
     var body: some View {
          
             TabView(selection: $selectedTab) {
                 Group {
                     NavigationView{PostsView()}
                         .tabItem { Image(systemName: "house") }
                         .tag(0)
                     
                     NavigationView{SearchUserView()}
                         .tabItem { Image(systemName: "network") }
                         .tag(1)
                     ColabView()
                         .tabItem { Image(systemName: "music.note") }
                         .tag(2)
                     MainMessagesView()
                         .tabItem { Image(systemName: "bubble.right") }
                         .tag(3)
                     
                    ProfileView()
                         .tabItem { Image(systemName: "person") }
                         .tag(4)
                 }
                
                 
             }
             .accentColor(Color("button2-color"))

         
     }
}

#Preview {
    MainView()
}
