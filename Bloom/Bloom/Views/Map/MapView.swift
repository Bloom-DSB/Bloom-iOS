//
//  MapView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject var locationManager = LocationDataManager.shared
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: 127.4194), // 초기 위치 (샌프란시스코)
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.none), annotationItems: locationManager.landmarks) { landmark in
            MapMarker(coordinate: landmark.coordinate, tint: .red)
        }
        
//        Map(initialPosition: .automatic,
//            bounds:
//                MapCameraBounds(minimumDistance: 1000, maximumDistance: 100000),
//            interactionModes: .all) {
//            
//        }
//            .mapControlVisibility(.visible)
//            .onAppear {
//                locationManager.requestLocation()
//            }
//            .onReceive(locationManager.$location) { location in
//                if let location = location {
//                    region = MKCoordinateRegion(
//                        center: location.coordinate,
//                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                    )
//                }
//            }
        
    }
}

class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let shared = LocationDataManager()
    private let locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var location: CLLocation?
    @Published var landmarks: [Landmark] = []

    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        landmarks = [
            Landmark(name: "Golden Gate Bridge", coordinate: CLLocationCoordinate2D(latitude: 37.8199, longitude: 127.4783)),
            Landmark(name: "Alcatraz Island", coordinate: CLLocationCoordinate2D(latitude: 37.8267, longitude: 127.4233))
        ]
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
            break
            
        case .restricted:
            authorizationStatus = .restricted
            break
            
        case .denied:
            authorizationStatus = .denied
            break
            
        case .notDetermined:
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
    }
    func requestLocation() {
        locationManager.requestLocation()
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        DispatchQueue.main.async {
            self.location = latestLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("error: \(error.localizedDescription)")
    }
    
    
}

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    MapView()
}

