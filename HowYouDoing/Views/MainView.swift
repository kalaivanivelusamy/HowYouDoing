
import SwiftUI

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
    var body: some View {
        
        TabView{
            HomeView(cityWeather: WeatherDataBycity()).tag(0)
                .edgesIgnoringSafeArea(.all)
            ChangeCityView().tag(1).edgesIgnoringSafeArea(.all)

        }
//        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle())

    }
}
