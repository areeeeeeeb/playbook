//
//  EventListView.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-02.
//

import SwiftUI
import MapKit


struct EventRow: View {
    var event: EventModel
    var timeFormat: String = "h:mm a"
    @State private var showEventDetail = false
    @State private var liked = false

    var body: some View {
        HStack {
            VStack(alignment: .center) {
                let eventDateFormatter: DateFormatter = {
                    let formatter = DateFormatter()
                    formatter.dateFormat = timeFormat
                    return formatter
                }()
                
//                Text(event.date, formatter: eventDateFormatter)
//                    .font(.callout)
//                    .bold()
//                    .foregroundColor(.white)
//            
                Text(event.emoji)
                    .font(.system(size: 50))
            }
            
            VStack(alignment: .leading) {
                Text(event.title.uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                Text(event.headline)
                    .foregroundColor(.white)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                
//                HStack() {
//                    ForEach(event.tags, id: \.self) { tag in
//                        Text(tag)
//                            .font(.caption2)
//                            .modifier(RoundedBack(color: .gray.opacity(0.4)))
//                    }
//                }
                
                HStack() {
                    Text("@" + event.organizer.name)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                                
            }
    
            Spacer()
            Button(action: {
                self.liked.toggle()
            }) {
                Image(systemName: liked ? "heart.fill" : "heart")
                    .font(.system(size: 27))
                    .foregroundColor(.red)
            }.buttonStyle(PlainButtonStyle())
        }
        .onTapGesture {
            showEventDetail = true
        }
        .sheet(isPresented: $showEventDetail) {
            EventDetailView(event: event)
                .presentationDetents([
                        .fraction(0.93)
                ])
        }
        
        
    }
}

struct EventDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var event: EventModel
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                Text(event.title)
                    .font(.title.bold())
                Text(event.date.formatted())
                Button(action: {}) {
                    HStack(alignment: .center) {
                        Image(event.organizer.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        Text(event.organizer.name)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                    }
                }
                .frame(height: 18)
                
                HStack() {
                    ForEach(event.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption)
                            .modifier(RoundedBack())
                    }
                }
                
                Text("\nAbout")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Divider()
                Text(event.description).font(.body)
                
                Text("\nLocation")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Divider()
                Text(event.location.name)
                Text(event.location.address)
                    .font(.footnote)
                    .foregroundColor(.gray)
                ZStack {
                    Map(coordinateRegion:
                            .constant(MKCoordinateRegion(
                                center: CLLocationCoordinate2D(
                                    latitude: event.location.latitude,
                                    longitude: event.location.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))))
                    .frame(height: 200)
                    .cornerRadius(12)
                    .allowsHitTesting(false)
                    Image(systemName: "circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.purple)
                }
            }
            .padding()
        }
    }
    
}


struct EventListView: View {
    @State private var showEventDetail = false
    var title: String = "EVENTS"
    var foregroundColor: Color = .darkGray
    var events: [EventModel] = EventData.events
    var timeFormat: String = "h:mm a"
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                Spacer()
            }
            
            ForEach(events) { event in
                EventRow(event: event, timeFormat: timeFormat)
            }
            
        }
        .padding([.horizontal, .vertical], 12)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(foregroundColor)
                .padding([.horizontal, .vertical], 12)
        )
    }
}





struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack () {
                
                ScrollView {
                    EventListView(title: "TONIGHT!",
                                  foregroundColor: .darkGray,
                                  events: EventData.events.filter { event in
                        return Calendar.current.isDate(event.date, inSameDayAs: Date())
                    })
                    
                    EventListView(title: "COMING UP!",
                                  foregroundColor: .darkGray,
                                  events: EventData.events, timeFormat: "MMMM d ")
                }
            }
            
        }
        
    }
}

