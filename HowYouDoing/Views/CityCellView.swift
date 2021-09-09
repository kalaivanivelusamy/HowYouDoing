
import SwiftUI

struct CityCellView: View {
   
    @State var selectedCityName: String = ""

    @State var cityNames: [String] = ["Mumbai","Bangalore","Delhi","Chennai","Mumbai","Bangalore","Delhi","Chennai"]

    
        init() {
           UITableView.appearance().separatorStyle = .none
            UITableViewCell.appearance().backgroundColor = UIColor(Color.gray.opacity(0.25))
           UITableView.appearance().backgroundColor = UIColor(Color.clear)
        }
    
    
    var body: some View {
        
        List {
            Section(header: Text("Recent Picks").background(Color.clear)){
               recentCityNames
            }.listRowBackground(Color.clear)
        }.frame(width: UIScreen.main.bounds.width*0.60, height: 300, alignment: .center).padding(50)
    }
    
    var recentCityNames: some View {
        ForEach(cityNames, id: \.self) { city in
            Text(city).frame(height:30).font(.title2).foregroundColor(.white)
                .onTapGesture {
                    print("Tapped \(city)")
                    selectedCityName = city
                   // selection = .home
//                    HomeView(cityWeather: WeatherDataBycity(), cityName: $selectedCityName, tab: $selection).tag(Tab.home)
//                        .edgesIgnoringSafeArea(.all)

                }
        }
    }
}

struct CityCellView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
