

import SwiftUI

struct TemperatureView: View {
    
    @State var cityWeather: WeatherDataBycity 

    @State var temp: Double = 0.0
    @State var feelsLike: Float = 24
    @State var temp_max: Float = 32.3
    @State var temp_min: Float = 12.2
    @State var humidity: Int = 0

    
    var body: some View {
        
        HStack (spacing: 100){
            
            VStack {
                Spacer().frame(height: 50)

                Text("Humidity \(humidity)%").font(.caption).foregroundColor(.white)
                Text("8 mph").font(.caption).foregroundColor(.white)
                Text("☂ 100%").font(.caption).foregroundColor(.white)
            }
            
            VStack(alignment: .leading,spacing:5) {
                let formattedTemp = String(format: "%.1f", temp)
                let formattedFeelsLike = String(format: "%.1f", feelsLike)
                let formattedTempMax = String(format: "%.1f", temp_max)
                let formattedTempMin = String(format: "%.1f", temp_min)


                Text("\(formattedTemp)℃").font(.largeTitle).fontWeight(.semibold).foregroundColor(.white)
                Text("Feels like \(formattedFeelsLike)℃").font(.caption).foregroundColor(.white)
                Spacer().frame(height: 5)
                HStack(spacing: 5){
                    Text("↑ \(formattedTempMax)℃").font(.caption).foregroundColor(.white)
                    Text("↓ \(formattedTempMin)℃").font(.caption).foregroundColor(.white)
                }
            }
            
        }//.frame(alignment: .trailing)
        
        
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
