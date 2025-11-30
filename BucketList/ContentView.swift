//
//  ContentView.swift
//  BucketList
//
//  Created by Antonio Giroz on 23/11/25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var vm = ViewModel()
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 36.719444, longitude: -4.420000),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        NavigationStack {
            if vm.isUnlocked {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(vm.locations) { location in
                            Annotation(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture(minimumDuration: 0.2) {
                                        vm.selectedLocation = location
                                    }
                            }
                        }
                    }
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            vm.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $vm.selectedLocation) { location in
                        EditLocationView(location: location) {
                            vm.update(location: $0)
                        }
                    }
                }
            } else {
                Map(initialPosition: startPosition)
                    .toolbar {
                        Button("Unlock Places", action: vm.authenticate)
                            .buttonStyle(.borderedProminent)
                    }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
