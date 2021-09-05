
import Foundation

enum Units: Int{
    case metric = 0
    case imperial = 1
    
    var stringValue: String {
        switch self {
            case .imperial:
                return "imperial"
            case .metric:
                return "metric"
        }
    }
}

class WeatherDataBycity: ObservableObject {
    
    @Published var weatherDetail: WeatherDetail? = nil
    var weatherMain: WeatherDetail.Main? = nil
    
//    let city: String
//    
//    init(city: String) {
//        self.city = city
//    }
    
    func addCity(city: String) {
//        fetch(completion: {
//            
//        }) 
    }

    
    func fetch(city: String,units: Units = .metric, completionHandler: @escaping () -> Void) {

        API.shared.getWeatherRequest(path: "weather", params: ["q" : city,"units": units.stringValue]) { (result: Result<WeatherDetail,API.APIError>) in 
            
            switch result {
                case .success(_) :
                    if let weatherDetail = try? result.get(){
                        self.weatherDetail = weatherDetail
                        self.weatherMain = weatherDetail.main
                    }
                case .failure(_):
                    break
            }
            
        }
    }
    
}
