//
//  TripFunctions.swift
//  Itinerary
//
//  Created by Razvan Puiu on 20/10/2019.
//  Copyright © 2019 Razvan Puiu. All rights reserved.
//

import Foundation

class TripFunctions{
    
    static func creatTrip(tripModel: TripModel){
        
    }
    
    static func readTrips(completion: @escaping () -> ()){
        DispatchQueue.global(qos: .userInteractive).async {
             if Data.tripModels.count == 0{
                 Data.tripModels.append(TripModel(title: "Trip To Bali"))
                 Data.tripModels.append(TripModel(title: "Trip To Mehico"))
                 Data.tripModels.append(TripModel(title: "Trip To Russia"))
             }
            DispatchQueue.main.async {
                       completion()
                   }
        }
       
        
        
    }
    
    static func updateTrip(tripModel: TripModel){
        
    }
    
    static func deleteTrip(tripModel: TripModel){
        
        
    }
}
