

import SwiftUI

struct HomeView: View {
   
    
    @State var selectedMetrics: Int = 0
    @State var selectedUnit: Units = Units.metric
    @ObservedObject var cityWeather: WeatherDataBycity 
    
    @Binding var cityName: String

    @Binding var tab: Tab
    
    
    @State private var showCurrentLocationSheet = false

    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    Button(action: {
                        tab = .home
                        showCurrentLocationSheet.toggle()
                    }, label: {
                        Text("Change City").foregroundColor(.white).font(.caption)
                    })
                    .padding(.trailing,10)
                    .sheet(isPresented: $showCurrentLocationSheet, content: {
                        ChangeCityView(tab: $tab, cityName: $cityName, cityWeather: WeatherDataBycity(), showCurrentLocationSheet: $showCurrentLocationSheet)
                    })
                    
                    
                    MetricPicker(cityWeather: cityWeather, cityName: $cityName)
                    
                    Text(cityWeather.weatherDetail?.name.description ?? "").foregroundColor(.white).font(.caption)
                }
                .frame(width:100,height: 40)
                .padding(.leading,300)
                
                .onAppear(perform: {
                    cityWeather.fetch(city: cityName,units: Units(rawValue: selectedMetrics) ?? .metric) {
                        cityWeather.weatherDetail?.main.feels_like
                    }
                })
                
                VStack (alignment: .leading, spacing: 30){
                   
                    if let weatherDetail = cityWeather.weatherDetail{
                        TemperatureView(cityWeather: cityWeather, selectedMetrics: $selectedUnit)
                        .frame(alignment: .trailing)
                        WeatherMoodView(cityWeather: cityWeather, image: "cloud.sun.rain.fill")
                        Text("Last updated on \(weatherDetail.date)").font(.caption2).foregroundColor(.white).lineLimit(2).padding(15)
                    }
                    
                }.padding(.top,350).padding(.leading,15)
                
            }
            
        }
    }
}

struct MetricPicker: View {
    
    @State var selectedMetrics: Int = 0
    @State var selectedUnit: Units = Units.metric
    @ObservedObject var cityWeather: WeatherDataBycity 
    @Binding var cityName: String

   
    var body: some View {
        
        Picker("Change metrics", selection: $selectedMetrics) {
            Text("℃").tag(0) 
            Text("℉").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: selectedMetrics){ val in
            selectedUnit = Units(rawValue: selectedMetrics) ?? .metric
            cityWeather.fetch(city: cityName,units: Units(rawValue: selectedMetrics) ?? .metric) { 
                cityWeather.weatherDetail?.main.feels_like
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}



