
import Foundation

struct Weather: Identifiable,Codable {
    
    let id: Int 
    let main: String
    let description: String
    let icon: String
}
