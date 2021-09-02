
import Foundation

class WeatherDataBycity: ObservableObject {
    
    @Published var weatherDetail: WeatherDetail? = nil
    
    let city: String
    
    init(city: String) {
        self.city = city
    }
    
    func addCity(city: String) {
//        fetch(completion: {
//            
//        }) 
    }

    
    func fetch(completion: @escaping () -> Void) {
        
        API.shared.getWeatherRequest(path: "weather", params: ["q" : "bangalore"]) { (result: Result<WeatherDetail,API.APIError>) in 
            
            switch result {
                case .success(_) :
                    if let weatherDetail = try? result.get(){
                        self.weatherDetail = weatherDetail
                    }
                case .failure(_):
                    break
            }
            
        }
    }
    
}
