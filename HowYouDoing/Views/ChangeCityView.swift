
import SwiftUI

struct ChangeCityView: View {
    
    @Binding var tab: Tab

    @Binding var cityName: String
    @StateObject var locationManager = LocationManager()
    
    @ObservedObject var cityWeather: WeatherDataBycity 


    var body: some View {
        
       
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
       
            VStack{
                TextField("Enter Location", text: $cityName).frame(alignment: .center).textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading,100)
                    .padding(.trailing,100)
                    .foregroundColor(.primary)
                
                Button(action: {
                    
                    cityWeather.fetch(city: cityName,units: .metric) {
                       // print(weather.weatherDetail)
                        cityWeather.weatherDetail?.main.feels_like
                    }
                    
                }, label: {
                    Text("Check Weather").foregroundColor(.white).font(.title)
                })
               
                CityCellView(selectedCityName: $cityName, tab: $tab)
            
                Button(action: {
                
                }, label: {
                    Text("Use Current location").foregroundColor(.white).font(.title).fontWeight(.bold)
                })
            }
        }
    }
}

struct ChangeCityView_Previews: PreviewProvider {
    static var previews: some View {
        //ChangeCityView(tab: )
        ContentView()
    }
}
