//
//  HeaderView.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/22/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    //MARK: Properties
    
    
    var body: some View {
        HStack {
            Text("YELP API").font(Font.largeTitle)
            Spacer()
            LocationView()
        }
    }
}
