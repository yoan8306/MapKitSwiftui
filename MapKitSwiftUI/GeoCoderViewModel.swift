//
//  GeoCoderViewModel.swift
//  MapKitSwiftUI
//
//  Created by Yoan on 26/09/2023.
//

import Foundation
import MapKit
import CoreLocation

class GeoCoderViewModel: ObservableObject {
    @Published var placeMark: CLPlacemark?
    
    func convertToLocationToAdress(coordinate: CLLocationCoordinate2D?) {
        let geoCoder = CLGeocoder()
        guard let coordinate = coordinate else {
            return
        }
        let location: CLLocation = CLLocation(latitude:coordinate.latitude , longitude: coordinate.longitude)
        
        geoCoder.reverseGeocodeLocation(location) {placeMark, error in
            guard error == nil, let placeMark = placeMark else {
                return
            }
            if let address = placeMark.first {
                self.placeMark = address
            }
        }
    }
}
