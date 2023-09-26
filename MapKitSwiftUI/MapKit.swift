//
//  MapKit.swift
//  MapKitSwiftUI
//
//  Created by Yoan on 26/09/2023.
//

import SwiftUI
import MapKit

struct MapKit: View {
    @ObservedObject var geoCoderViewModel = GeoCoderViewModel()
    let mapCamera = MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 46.602, longitude: 2.072), distance: 3000000, heading: 0, pitch: 0)
    @State var pinLocation: CLLocationCoordinate2D?
    
    var body: some View {
        MapReader { reader in
            Map(initialPosition: MapCameraPosition.camera(mapCamera)) {
                if let positionMark = pinLocation {
                    Marker("\(geoCoderViewModel.placeMark?.name ?? "") \n\(geoCoderViewModel.placeMark?.locality ?? "") \n\(geoCoderViewModel.placeMark?.location?.coordinate.latitude ?? 0)° \n\(geoCoderViewModel.placeMark?.location?.coordinate.longitude ?? 0)°", coordinate: positionMark)
                        .tint(.orange)
                }
            }
            .onTapGesture(perform: { screenCoord in
                pinLocation = reader.convert(screenCoord, from: .local)
                geoCoderViewModel.convertToLocationToAdress(coordinate: pinLocation)
            })
        }
    }
}

#Preview {
    MapKit()
}
