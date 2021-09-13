
import SwiftUI

enum Tab {
    
    case daily
    case home
    case location
}

struct MainView: View {
    var body: some View {
            PageView()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct PageView: View {
   
    @State var selection: Tab = .home 
    @State var cityName: String = "Bangalore"

    var body: some View {
        
        TabView(selection: $selection) {
            
            HomeView(cityWeather: WeatherDataBycity(), cityName: $cityName, tab: $selection).tag(Tab.home)
                .edgesIgnoringSafeArea(.all)
            
            WeeklyView()
            
            //ChangeCityView(tab: $selection, cityName: $cityName, cityWeather: WeatherDataBycity()).tag(Tab.location).edgesIgnoringSafeArea(.all)
        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle())

    }
}
