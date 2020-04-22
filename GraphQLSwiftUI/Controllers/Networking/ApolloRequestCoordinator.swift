//
//  ApolloNetworkingController.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/20/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import Combine
import Apollo
import CoreLocation

class ApolloNetworkingController: ObservableObject {
    @Published var businesses: [BusinessFragment] = []
    
    @Published var businessesQueryRunning: Bool = false
    
    @Published var businessesQueryError: Error?
    
    @Published var searchText: String = "Food"
    
    lazy var locationController: LocationController = LocationController()

    //MARK: Combine Subscriptions
    var searchTextSubscription: AnyCancellable?
    
    var locationSubscription: AnyCancellable?
    
    init() {
        self.searchTextSubscription = self.$searchText.debounce(for: .milliseconds(500), scheduler: RunLoop.main).sink(receiveValue: { (newSearchText) in
            print(newSearchText)
            self.retrieveBusinesses(searchText: newSearchText, location: self.locationController.location.coordinate)
        })
        self.locationSubscription = self.locationController.$location.sink(receiveValue: { (location) in
            self.retrieveBusinesses(searchText: self.searchText, location: location.coordinate)
        })
        self.retrieveBusinesses(searchText: self.searchText, location: self.locationController.location.coordinate)
    }
    
    func retrieveBusinesses(searchText text: String, location: CLLocationCoordinate2D) {
        self.businessesQueryError = nil
        self.businessesQueryRunning = true
        self.businesses.removeAll()
        let query = BusinessesQuery.init(searchTerm: text, latitude: location.latitude, longitude: location.longitude)
        ApolloController.shared.client.fetch(query: query) { (results) in
            self.businessesQueryRunning = false
            switch results {
            case .failure(let error):
                self.businessesQueryError = error
            case .success(let graphQLResults):

                guard let searchResults = graphQLResults.data?.search?.business else {
                    break
                }

                for item in searchResults {
                    if let fragment = item?.fragments.businessFragment {
                        self.businesses.append(fragment)
                    }
                }
            }
        }
    }
}
