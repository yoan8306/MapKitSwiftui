//
//  GeoCoderViewModel.swift
//  MapKitSwiftui
//
//  Created by Yoan on 26/09/2023.
//

import Foundation
import CoreLocation

class GeoCoderViewModel: ObservableObject {
    func convertToLocationToAdress(coordinate: CLLocationCoordinate2D?, completion: @escaping (CLPlacemark?) -> Void) {
        let geoCoder = CLGeocoder()
        guard let coordinate = coordinate else {
            completion(nil)
            return
        }
        let location: CLLocation = CLLocation(latitude:coordinate.latitude , longitude: coordinate.longitude)
        
        geoCoder.reverseGeocodeLocation(location) {placeMark, error in
            guard error == nil, let placeMark = placeMark else {
                return
            }
            if let address = placeMark.first {
                completion(address)
            } else {
                completion(nil)
            }
        }
    }
}
