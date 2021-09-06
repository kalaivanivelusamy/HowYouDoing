
import SwiftUI

struct ChangeCityView: View {
    
    //@Binding var tab: Tab = Tab.location

    @State var cityName: String = "Bangalore"
    @StateObject var locationManager = LocationManager()
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = UIColor(Color.clear)
       UITableView.appearance().backgroundColor = UIColor(Color.clear)
    }


    var body: some View {
       
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
       
            VStack{
                TextField("Enter Location", text: $cityName).frame(alignment: .center)
                List{
                    Text("Mumbai").background(Color.clear)
                    Text("chennai")
                    
                }
                .frame(width: UIScreen.main.bounds.width*0.60, height: 300, alignment: .center).padding(50)
                .listRowBackground(Color.clear)
            
                Button(action: {
                
                }, label: {
                    Text("Use Current location")
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
