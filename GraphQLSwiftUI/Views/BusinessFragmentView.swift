//
//  BusinessFragmentView.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/22/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct BusinessFragmentView: View {
    //MARK: Properties
    let business: BusinessFragment
    
    //MARK: Computed Properties
    var body: some View {
        
        ZStack {

            WebImage(url: self.parse(object: self.business))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade) // Fade Transition
                .scaledToFill()
                .frame(alignment: .center)
            
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "link").frame(width: 46, height: 46).background(Color.gray.opacity(0.7)).foregroundColor(Color.white).overlay(
                        RoundedRectangle(cornerRadius: 23).stroke(Color.white, lineWidth: 0.5)
                    ).cornerRadius(23).padding().shadow(radius: 7)
                }
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Name: \(self.business.name ?? "No name")").padding(.all, 4)
                        Text("Rating: \(String(format:"%.1f", self.business.rating ?? -1))").padding(.all, 4)
                        Text("Distance: \(String(format:"%.0f", self.business.distance ?? -1)) Meters").padding(.all, 4)
                    }.background(Color.gray.opacity(0.7)).foregroundColor(Color.white).overlay(
                        RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 0.5)
                        ).cornerRadius(8).padding().shadow(radius: 7)
                    Spacer()
                }
            }
        }
    }
    
    //MARK: Init
    init(fragment: BusinessFragment) {
        self.business = fragment
    }
    
    //MARK: Functions
    func parse(object: BusinessFragment) -> URL {
        guard let firstImage = object.photos?.first else {
            return URL(string: "")!
        }
        return URL(string: firstImage ?? "")!
    }
}
