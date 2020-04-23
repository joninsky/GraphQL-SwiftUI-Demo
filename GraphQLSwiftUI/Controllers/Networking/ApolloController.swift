//
//  ApolloClient.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/20/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import Foundation
import Apollo

// MARK: - Singleton Wrapper

class ApolloController {
    
    static let shared = ApolloController()
    
    let YELP_API_KEY = "<put it here>"
  
    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "https://api.yelp.com/v3/graphql")!)
        transport.delegate = self
        return transport
    }()
    
    // Use the configured network transport in your Apollo client.
    private(set) lazy var client = ApolloClient.init(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension ApolloController: HTTPNetworkTransportPreflightDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
                        
        // Get the existing headers, or create new ones if they're nil
        var headers = request.allHTTPHeaderFields ?? [String: String]()

        //Needed for YELP API or you get an error about language.
        headers["Accept-Language"] = "en_US"

        // Add any new headers you need
        headers["Authorization"] = "Bearer \(self.YELP_API_KEY)"

        // Re-assign the updated headers to the request.
        request.allHTTPHeaderFields = headers
    }
}
