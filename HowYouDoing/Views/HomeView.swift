

import SwiftUI

struct HomeView: View {
    @State var selectedMetrics: Int = 0
    @ObservedObject var cityWeather = WeatherDataBycity(city: "bangalore")
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    Button(action: {
                       
                    }, label: {
                        Text("Change City").foregroundColor(.white).font(.caption)
                    }).padding(.trailing,10)
                    
                    Picker("Change metrics", selection: $selectedMetrics) {
                        Text("℃").tag(0) 
                        Text("℉").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text(cityWeather.weatherDetail?.name.description ?? "").foregroundColor(.white).font(.caption)
                }
                .frame(width:100,height: 40)
                .padding(.leading,300)
                
                .onAppear(perform: {
                    cityWeather.fetch {
                       // print(weather.weatherDetail)
                    }
                })
//                Spacer().frame(height:100)
                
                VStack (alignment: .leading, spacing: 30){
                   
                    TemperatureView(temp: (cityWeather.weatherDetail?.main.temp) ?? 0.0,feelsLike: (cityWeather.weatherDetail?.main.feels_like) ?? 0.0,temp_max: (cityWeather.weatherDetail?.main.temp_max) ?? 0.0,temp_min: (cityWeather.weatherDetail?.main.temp_min) ?? 0.0).frame(alignment: .trailing)
                    
                    WeatherMoodView(image: "cloud.sun.rain.fill")
                    
                    Text("Last updated on Aug 30,2021 at 11:16 PM").font(.caption2).foregroundColor(.white)
                }.padding(.top,350)
                
            }//.frame(alignment: .trailing)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
