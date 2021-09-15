

import Foundation

struct API {
    
    let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/")!
    let baseURLForHourly = URL(string: "https://pro.openweathermap.org/data/2.5")!
    
    let apiKey = "c773685ab715741ea8d24aeadc29a6df"
    
    static let shared: API = API()
    
    enum APIError: Error {
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
    }

    
    func getWeatherRequest<T: Codable>(path: String, params: [String: String]? = nil, completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        let queryURL = baseURL.appendingPathComponent(path)
        
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "appid", value: apiKey)]
        
        params?.forEach { value in
            components?.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            
        }
        
        if let url = components?.url{
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            
            let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.noResponse))
                    }               
                    return
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.networkError(error: error)))
                    } 
                    return
                }
                
                do{
                    let weatherData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(weatherData))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.jsonDecodingError(error: error)))   
                    }
                }
            }
            
            task.resume()

        }
        
    }
    
    
    func getHourlyWeatherRequest<T: Codable>(path: String, params: [String: String]? = nil, completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        let queryURL = baseURLForHourly.appendingPathComponent(path)
        
        var components = URLComponents(url: queryURL, resolvingAgainstBaseURL: true)
        components?.queryItems = [URLQueryItem(name: "appid", value: apiKey)]
        
        params?.forEach { value in
            components?.queryItems?.append(URLQueryItem(name: value.key, value: value.value))
            
        }
        
        if let url = components?.url{
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            
            let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.noResponse))
                    }               
                    return
                }
                
                if let error = error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.networkError(error: error)))
                    } 
                    return
                }
                
                do{
                    let weatherData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(weatherData))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.jsonDecodingError(error: error)))   
                    }
                }
            }
            
            task.resume()

        }
        
    }
    
}



