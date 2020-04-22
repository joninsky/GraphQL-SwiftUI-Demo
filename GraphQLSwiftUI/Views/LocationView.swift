//
//  LocationView.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/21/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var locationController: LocationController
    
    var locationSymbol: String {
        switch self.locationController.authorization {
        case .authorizedWhenInUse:
            return "location.fill"
        default:
            return "location.slash.fill"
        }
    }
    
    var locationSymbolColor: Color {
        switch self.locationController.authorization {
        case .authorizedWhenInUse:
            return Color.blue
        default:
            return Color.red
        }
    }
    
    var body: some View {
        Button(action: { self.locationController.manager.requestWhenInUseAuthorization() }) {
            Image(systemName: self.locationSymbol).foregroundColor(self.locationSymbolColor)
            }.frame(width: 46, height: 46).cornerRadius(23).background(Color.white).clipShape(Circle()).shadow(radius: 7)
    }
}
