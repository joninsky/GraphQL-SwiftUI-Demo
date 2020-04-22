//
//  SearchBar.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/21/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    //MARK: Properties
    @EnvironmentObject var networkingController: ApolloNetworkingController
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search the YELP API", text: self.$networkingController.searchText)
            }.padding()
            Color.black.frame(height: 0.5).opacity(0.7)
        }

    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar().padding()
    }
}
