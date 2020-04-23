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
    //Get the networking controller from the environment objects.
    @EnvironmentObject var networkingController: ApolloNetworkingController
    //Do the same with the location controller even though we could access this controller as a property of the network controller.
    @EnvironmentObject var locationController: LocationController
    
    //Swift UI Magic
    var body: some View {
        //Make a ZStack so you can layout in three dimensions
        ZStack {
            //A VStack will hold what we need.
            VStack {
                //Include the header view and a divider no matter what.
                HeaderView().padding()
                Color.black.frame(height: 0.5)
                //If no location is authorized so a message abotu what to do in the middle of the screen.
                if self.locationController.authorization != CLAuthorizationStatus.authorizedWhenInUse {
                    Spacer()
                    Text("Please tap the location button to authorize location.").multilineTextAlignment(.center).padding()
                    Spacer()
                //If there was a networking error show the search bar and a description of the error.
                }else if self.networkingController.businessesQueryError != nil  {
                    SearchBar()
                    Spacer()
                    Text("There was an error making the request: \(self.networkingController.businessesQueryError?.localizedDescription ?? "Unknown error")").multilineTextAlignment(.center).padding()
                    Spacer()
                //If we have results then display then in a list. Add a button to the Cell so that we can get touch events to open the link in Safari.
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
