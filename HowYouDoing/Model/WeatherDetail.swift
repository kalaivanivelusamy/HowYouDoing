
import Foundation

struct WeatherDetail: Identifiable,Codable {
    
    let id: Int
    
    let timezone: Int
    let name: String
    let cod: Int
    let base: String
    let visibility: Int?
    
    let dt: TimeInterval
    var date: Date{
        return Date(timeIntervalSince1970: dt)
    }

    struct Coordinates: Codable {
        let lon: Float
        let lat: Float
    }
    
    let coord: Coordinates
    
    let weather: [Weather]
  
    
    let main: Main 
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Float
        let temp_min: Float
        let temp_max: Float
        let pressure: Float
        let humidity: Int
    }
    
    let wind: Wind 
    let clouds: Clouds 
    
    struct Sys: Codable,Identifiable {
        
        let id: Int
        let type: Int?
        let country: String
        let sunrise: TimeInterval
        let sunset: TimeInterval
    }
    
    let sys: Sys 
    
   
    
}
