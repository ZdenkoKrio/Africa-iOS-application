//
//  MapView.swift
//  Africa
//
//  Created by Zdenko Čepan on 20/07/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates,
                                           span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: Body
    var body: some View {
        // MARK: Basic Map
        //Map(coordinateRegion: $region)
        
        // MARK: Advanced Map
        Map(coordinateRegion: $region,
            annotationItems: locations,
            annotationContent: { item in
                // MARK: A - Map Pin (Always Static) -> Old
                //MapPin(coordinate: item.location, tint: .accentColor)
                
                // MARK: B - Map Marker (Always Static) -> New Style
                //MapMarker(coordinate: item.location, tint: .accentColor)
                
                // MARK: C - Custom Basic Anotation (could be interactive)
                //MapAnnotation(coordinate: item.location) {
                //    Image("logo")
                //        .resizable()
                //        .scaledToFit()
                //        .frame(width: 32, height: 32, alignment: .center)
                //} // ANNOTATION
                
                // MARK: D - Custom Advanced Annotation (could be interactive)
                
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }) // MAP
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        } // HSTACK
                        
                        Divider()
                        
                        HStack {
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        } // HSTACK
                    } // VSTACK
                } // HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
                , alignment: .top
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewDevice("iPhone 11 Pro")
    }
}
