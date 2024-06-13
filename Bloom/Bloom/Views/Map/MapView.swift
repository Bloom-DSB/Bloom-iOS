//
//  MapView.swift
//  Bloom
//
//  Created by 조다은 on 6/9/24.
//

import SwiftUI
import MapKit
import Alamofire

struct MapView: View {
    @StateObject var locationManager = LocationDataManager.shared
    @StateObject private var viewModel = MarketViewModel()
    @State private var selectedMarket: Market? = nil
    @State private var showRescanButton = false
    @State private var centerCoordinate = CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), // 예시: 서울 중심 좌표
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $region, showsUserLocation: true,
                annotationItems: viewModel.markets) { market in
                MapAnnotation(coordinate: market.locationCoordinate) {
                    MapMarketAnnotationView(market: market)
                        .onTapGesture {
                            selectedMarket = market
                        }
                }
            }
                .onAppear {
                    viewModel.loadMarkets(
                        minLatitude: 37.55857699099099,
                        maxLatitude: 37.576595009009,
                        minLongitude: 126.9663830970558,
                        maxLongitude: 126.9891149029442
                    )
                }
                .edgesIgnoringSafeArea(.all)
                .onChange(of: region.center) { newCenter in
                    centerCoordinate = newCenter
                    showRescanButton = true
                    print("Center Coordinate: \(centerCoordinate.latitude), \(centerCoordinate.longitude)")
                }
            
            if showRescanButton {
                VStack {
                    Button(action: {
                        let (minLatitude, maxLatitude, minLongitude, maxLongitude) = viewModel.calculateBoundary(latitude: centerCoordinate.latitude, longitude: centerCoordinate.longitude);                        viewModel.loadMarkets(
                            minLatitude: minLatitude,
                            maxLatitude: maxLatitude,
                            minLongitude: minLongitude,
                            maxLongitude: maxLongitude
                        )
                        showRescanButton = false
                    }) {
                        HStack {
                            Image(systemName: "arrow.clockwise")
                                .bold()
                            Text("현 지도에서 검색")
                                .font(.pretendardSemiBold(size: 18))
                        }
                        .padding()
                        .frame(width: 353)
                        .background(Color.pointOrange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    }
                    .padding()
                    Spacer()
                }
            }
            if let selectedMarket {
                VStack {
                    Spacer()
                    MapMarketRow(market: selectedMarket)
                        .padding(.bottom,76)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut)
            }
        }
    }
}

struct MapMarketAnnotationView: View {
    var market: Market
    
    var body: some View {
        VStack {
            Image("flower")
                .shadow(radius: 5)
            Text(market.name)
                .font(.caption)
                .padding(5)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
        }
    }
}


import Combine

class MarketViewModel: ObservableObject {
    @Published var markets: [Market] = []
    
    func loadMarkets(minLatitude: Double, maxLatitude: Double, minLongitude: Double, maxLongitude: Double) {
        let url = "\(NetworkConfig.baseURL)/markets"
        let params: [String: Any] = [
            "min_latitude": minLatitude,
            "max_latitude": maxLatitude,
            "min_longitude": minLongitude,
            "max_longitude": maxLongitude
        ]
        
        print("min_latitude: \(minLatitude), max_latitude: \(maxLatitude), min_longitude: \(minLongitude), max_longitude: \(maxLongitude)")
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: MarketResponse.self) { response in
            switch response.result {
            case .success(let result):
                print(result)
                DispatchQueue.main.async {
                    self.markets = result.data
                    print("load markets \n \(self.markets)")
                }
            case .failure(let error):
                print("Failed to fetch markets: \(error.localizedDescription)")
            }
        }
        
    }
    func calculateBoundary (latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> (CLLocationDegrees, CLLocationDegrees, CLLocationDegrees, CLLocationDegrees) {
        let radiusInKm: Double = 1.0
        let deltaLat = radiusInKm / 111.0
        let deltaLon = radiusInKm / (111.0 * cos(latitude * .pi / 180.0))
        
        let minLat = latitude - deltaLat
        let maxLat = latitude + deltaLat
        let minLon = longitude - deltaLon
        let maxLon = longitude + deltaLon
        
        return (minLat,maxLat,minLon,maxLon)
    }
    
}



class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let shared = LocationDataManager()
    private let locationManager = CLLocationManager()
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var location: CLLocation?
    @Published var landmarks: MarketResponse?
    
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
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

#Preview {
    MapView()
}

//
//  MarketRow.swift
//  Bloom
//
//  Created by 조다은 on 6/12/24.
//

struct MapMarketRow: View {
    var market: Market
    @State private var isFavorite = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                HStack(spacing: 0) {
                    // 왼쪽 큰 이미지
                    if let firstImageURL = market.simpleProducts.first?.images.first {
                        //                        AsyncImage(url: url) { image in
                        //                            image
                        CachedAsyncImage(url: firstImageURL)
                        //                                .resizable()
                        //                                .aspectRatio(contentMode: .fill)
                        //                        }
                        //                placeholder: {
                        //                            Color.gray
                        //                        }
                            .frame(width: UIScreen.main.bounds.width * 0.57, height: 160)
                            .clipped()
                    } else {
                        Color.gray
                            .frame(width: UIScreen.main.bounds.width * 0.57, height: 160)
                    }
                    
                    VStack(spacing: 0) {
                        // 오른쪽 상단 작은 이미지
                        if market.simpleProducts.count > 1, let secondImageURL = market.simpleProducts[1].images.first {
                            //                            AsyncImage(url: url) { image in
                            //                                image
                            CachedAsyncImage(url: secondImageURL)
                            //                                    .resizable()
                            //                                    .aspectRatio(contentMode: .fill)
                            //                            } placeholder: {
                            //                                Color.gray
                            //                            }
                                .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                                .clipped()
                        } else {
                            Color.gray
                                .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                        }
                        
                        // 오른쪽 하단 작은 이미지
                        if market.simpleProducts.count > 2, let secondImageURL = market.simpleProducts[2].images.first {
                            //                            AsyncImage(url: url) { image in
                            //                                image
                            CachedAsyncImage(url: secondImageURL)
                            //                                    .resizable()
                            //                                    .aspectRatio(contentMode: .fill)
                            //                            } placeholder: {
                            //                                Color.gray
                            //                            }
                                .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                                .clipped()
                        } else {
                            Color.gray
                                .frame(width: UIScreen.main.bounds.width * 0.33, height: 80)
                        }
                    }
                }
                .padding(.bottom, 2)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.clear, lineWidth: 0)
                )
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .padding(10)
                        .background(.white)
                        .foregroundStyle(isFavorite ? Color.pointOrange : Color.gray5)
                        .clipShape(Circle())
                }
                .padding(10)
                .contentShape(Rectangle())
                .onTapGesture {
                    isFavorite.toggle()
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            HStack {
                Text("\(market.name)")
                    .font(.pretendardSemiBold(size: 18))
                
                Spacer()
                
                Text(market.isOperation ? "운영중" : "휴무중")
                    .padding(4)
                    .font(.pretendardRegular(size: 12))
                    .frame(width: 60, height: 22)
                    .foregroundStyle(market.isOperation ? Color.operating : Color.preparing)
                    .background(market.isOperation ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
                    .cornerRadius(99)
            }
            .padding(.horizontal, 20)
            HStack {
                HStack {
                    Image("location-icon")
                    
                    Text("\(market.location)")
                        .font(.pretendardRegular(size: 15))
                        .foregroundStyle(Color.gray2)
                }
                
                Spacer()
                
                Text("\(market.summary)")
                    .font(.pretendardRegular(size: 14))
                    .foregroundStyle(Color.gray3)
                    .lineLimit(1)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 20)
        .listRowSeparator(.hidden)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
}

import CoreLocation

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
