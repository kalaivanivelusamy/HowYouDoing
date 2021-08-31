
import Foundation

struct WeatherDetail: Identifiable,Codable {
    
    let id: Int
    
    let timezone: Int
    let name: String
    let cod: Int
    let base: String
    let visibility: Int
    
    let dt: TimeInterval
    var date: Date{
        return Date(timeIntervalSince1970: dt)
    }

    struct Coordinates: Codable {
        let lon: Float
        let lat: Float
    }
    
    let coord: Coordinates //struct
    
    let weather: [Weather]
  
    
    let main: Main 
    
    struct Main: Codable {
        
        let temp: Float
        let feels_like: Float
        let temp_min: Float
        let temp_max: Float
        let pressure: Int
        let humidity: Int
        
    }
    
   
    
    let wind: Wind //struct
    
    let clouds: Clouds //struct
    
    
    struct Sys: Codable,Identifiable {
        
        var id = UUID()
        let type: Int?
        let country: String
        let sunrise: TimeInterval
        let sunset: TimeInterval
    }
    
    let sys: Sys 
    
    
    
    
    struct Wind {
        
    }
    
    struct Clouds {
        
    }
    
    struct Sys {
        
    }
    
}
