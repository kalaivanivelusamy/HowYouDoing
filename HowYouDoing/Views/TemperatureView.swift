

import SwiftUI

struct TemperatureView: View {
    
    @ObservedObject var cityWeather: WeatherDataBycity 

    @Binding var selectedMetrics: Units
    
    var body: some View {
        
        HStack (spacing: 100){
            
            VStack {
                Spacer().frame(height: 50)

                if let weatherDetail = cityWeather.weatherDetail{
                    let val = weatherDetail.main.humidity
                Text("Humidity \(String(describing: val)) %").font(.caption).foregroundColor(.white)
                }
                
                Text("8 mph").font(.caption).foregroundColor(.white)
                Text("☂ 100%").font(.caption).foregroundColor(.white)
            }
            
            VStack(alignment: .leading,spacing:5) {
                let formattedTemp = String(format: "%.1f", cityWeather.weatherDetail?.main.temp as! CVarArg)
                let formattedFeelsLike = String(format: "%.1f", cityWeather.weatherDetail?.main.feels_like as! CVarArg)
                let formattedTempMax = String(format: "%.1f", cityWeather.weatherDetail?.main.temp_max as! CVarArg)
                let formattedTempMin = String(format: "%.1f", cityWeather.weatherDetail?.main.temp_min as! CVarArg)


                Text("\(formattedTemp) \(selectedMetrics == .metric ? "℃" :  "℉")").font(.largeTitle).fontWeight(.semibold).foregroundColor(.white)

            
                Text("Feels like \(formattedFeelsLike) \(selectedMetrics == .metric ? "℃" :  "℉")").font(.caption).foregroundColor(.white)
                Spacer().frame(height: 5)
                HStack(spacing: 5){
                    Text("↑ \(formattedTempMax) \(selectedMetrics == .metric ? "℃" :  "℉")").font(.caption).foregroundColor(.white)
                    Text("↓ \(formattedTempMin) \(selectedMetrics == .metric ? "℃" :  "℉")").font(.caption).foregroundColor(.white)
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
