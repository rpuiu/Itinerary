
import Foundation

class TripFunctions{
    
    static func creatTrip(tripModel: TripModel){
        Data.tripModels.append(tripModel)
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
    
    static func deleteTrip(index: Int){
        Data.tripModels.remove(at: index)
        
    }
}
