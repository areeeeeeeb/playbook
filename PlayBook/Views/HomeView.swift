//
//  HomeView.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-14.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            ZStack {
                
                
                ScrollView {
                    Text("PlayBook")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    EventListView(title: "TONIGHT!",
                                  foregroundColor: .darkGray,
                                  events: EventData.events.filter { event in
                        return Calendar.current.isDate(event.date, inSameDayAs: Date())
                    })
                    
                    EventListView(title: "COMING UP!",
                                  foregroundColor: .darkGray,
                                  events: EventData.events, timeFormat: "MMM d")
                    
                    EventListView(title: "COMING UP!",
                                  foregroundColor: .darkGray,
                                  events: EventData.events, timeFormat: "MMM d")
                    
                    EventListView(title: "COMING UP!",
                                  foregroundColor: .darkGray,
                                  events: EventData.events, timeFormat: "MMM d")
                }
            }
            
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
