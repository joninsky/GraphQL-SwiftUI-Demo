//
//  ContentView.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/20/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var networkingController: ApolloNetworkingController
    
    @EnvironmentObject var locationController: LocationController
    
    var errorString: String {
        return self.networkingController.businessesQueryError?.localizedDescription ?? "No Error Description"
    }

    var body: some View {
        ZStack {
            VStack {
                HeaderView().padding()
                Color.black.frame(height: 0.5)
                if self.locationController.authorization != CLAuthorizationStatus.authorizedWhenInUse {
                    Spacer()
                    Text("Please tap the location button to authorize location.").multilineTextAlignment(.center).padding()
                    Spacer()
                }else if self.networkingController.businessesQueryError != nil  {
                    SearchBar()
                    Spacer()
                    Text("There was an error making the request: \(self.networkingController.businessesQueryError?.localizedDescription ?? "Unknown error")").multilineTextAlignment(.center).padding()
                    Spacer()
                }else {
                    SearchBar()
                    List(self.networkingController.businesses, id: \.id) { business in
                        ZStack {
                            Button(action: { self.open(urlString: business.url) }) {
                                Color.clear
                            }
                            BusinessFragmentView.init(fragment: business)
                        }
                    }
                }
            }
        }
    }
    
    func open(urlString: String?) {
        guard let url = URL(string: urlString ?? "") else { return }
        UIApplication.shared.open(url)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
