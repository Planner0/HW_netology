//
//  WelcomeView.swift
//  WeatherDemo
//
//  Created by Admin on 12.12.2021.
//

import SwiftUI
import CoreLocationUI
struct WelcomeView: View {
    @EnvironmentObject var locationManager:LocationManager
    var body: some View {
        VStack {
            VStack(spacing:20){
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to the weater in you area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
