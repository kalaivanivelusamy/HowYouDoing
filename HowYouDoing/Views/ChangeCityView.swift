
import SwiftUI

struct ChangeCityView: View {
    
    @Binding var tab: Tab

    @Binding var cityName: String
    @StateObject var locationManager = LocationManager()
    
    @ObservedObject var cityWeather: WeatherDataBycity 

    @Binding var showCurrentLocationSheet: Bool


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
                    }
                    showCurrentLocationSheet.toggle()
                }, label: {
                    Text("Check Weather").foregroundColor(.white).font(.title)
                })
               
                CityCellView(selectedCityName: $cityName, tab: $tab, showCurrentLocationSheet: $showCurrentLocationSheet)
            
                Button(action: {
                    cityName = locationManager.chosenCity ?? "Bangalore"
                    tab = .home
//                    HomeView(cityWeather: WeatherDataBycity(), cityName: $cityName, tab: $tab).tag(Tab.home)
                    showCurrentLocationSheet.toggle()
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
