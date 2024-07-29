//
//  ContentView.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2023-11-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                                                }
                    
                    
                EventListView()
                    .tabItem {
                        Image(systemName: "heart.fill")
                    }
                    
                
                
                EventListView()
                    .tabItem {
                        Image(systemName: "person.2.fill")
                    }
                    
                
                EventRow(event: EventData.events[0])
                    .tabItem {
                        Image(systemName: "calendar")
                    }
                    
            }
            
            .accentColor(/*@START_MENU_TOKEN@*/.pink/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
