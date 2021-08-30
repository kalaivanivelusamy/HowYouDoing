

import SwiftUI

struct HomeView: View {
    @State var selectedMetrics: Int = 0
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
                }
                .frame(width:100,height: 40,alignment: .trailing)
                
                
//                Spacer().frame(height:100)
                
                VStack (alignment: .leading, spacing: 30){
                   
                    TemperatureView().frame(alignment: .trailing)
                    
                    WeatherMoodView()
                    
                    Text("Last updated on Aug 30,2021 at 11:16 PM").font(.caption2).foregroundColor(.white)
                }.padding(.top,350)
                
            }
            
           
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
