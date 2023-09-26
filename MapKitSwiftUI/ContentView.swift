//
//  ContentView.swift
//  MapKitSwiftUI
//
//  Created by Yoan on 26/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapKit(geoCoderViewModel: GeoCoderViewModel())
    }
}

#Preview {
    ContentView()
}
