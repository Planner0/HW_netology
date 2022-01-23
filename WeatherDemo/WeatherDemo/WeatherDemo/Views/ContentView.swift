//
//  ContentView.swift
//  WeatherDemo
//
//  Created by Admin on 12.12.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                Text("Your coordinates are:\(location.longitude),\(location.latitude)")
            }else {
                if locationManager.isLoading{
                    LoadingView()
                } else {WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(red: 0.097, green: 0.762, blue: 0.958))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
