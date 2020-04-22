//
//  Double_Extensions.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/22/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import Foundation


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
