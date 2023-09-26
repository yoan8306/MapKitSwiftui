//
//  MapKit.swift
//  MapKitSwiftui
//
//  Created by Yoan on 26/09/2023.
//

import SwiftUI
import MapKit

struct MapKit: View {
    @ObservedObject var geoCoderViewModel = GeoCoderViewModel()
    let mapCamera = MapCamera(centerCoordinate: CLLocationCoordinate2D(), distance: .infinity, heading: 0, pitch: 0)
    @State var pinLocation: CLLocationCoordinate2D?
    @State var city = ""
    @State var name = ""
    
    var body: some View {
        MapReader { reader in
            Map(initialPosition: MapCameraPosition.camera(mapCamera)) {
                if let positionMark = pinLocation {
                    Marker("\(name) \n\(city)", coordinate: positionMark)
                        .tint(.orange)
                }
            }
                .onTapGesture(perform: { screenCoord in
                        pinLocation = reader.convert(screenCoord, from: .local)
                    getAddress()
                })
        }
    }
    
    func getAddress() {
        geoCoderViewModel.convertToLocationToAdress(coordinate: pinLocation) { placeMark in
            city = placeMark?.locality ?? "no city found"
            name = placeMark?.name ?? "no street found"
        }
    }
}

#Preview {
    MapKit()
}
