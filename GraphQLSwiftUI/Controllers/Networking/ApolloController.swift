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

        //Needed for YELP API
        headers["Accept-Language"] = "en_US"

        // Add any new headers you need
        headers["Authorization"] = "Bearer qco6Jeyqwo8-v8QRaCxWSiO5Fwr7JhWOSObUthK4ajdFVGuTvPHNjmi_b9A_UaOAmJzo2Vt6GlEmyxJwIOs2yWXr3FcPK0x3QBA-YpLFPq-w_UnIl9Q4bb0_SumwXHYx"

        // Re-assign the updated headers to the request.
        request.allHTTPHeaderFields = headers
    }
}
