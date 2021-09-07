


import SwiftUI

struct WeatherMoodView: View {
    @ObservedObject var cityWeather: WeatherDataBycity

    var image: String
    
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.white)
            if let weatherDetail = cityWeather.weatherDetail{
                Text("\(weatherDetail.name)").font(.caption).foregroundColor(.white)
            }
        }
    }
}

struct WeatherMoodView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
