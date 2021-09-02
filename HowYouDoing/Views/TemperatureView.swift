

import SwiftUI

struct TemperatureView: View {
    @State var temp: Double = 0.0
    @State var feelsLike: Float = 24
    @State var temp_max: Double = 32.3
    @State var temp_min: Double = 12.2
    
    var body: some View {
        
        HStack (spacing: 100){
            
            VStack {
                Spacer().frame(height: 50)

                Text("Humidity 75%").font(.caption).foregroundColor(.white)
                Text("8 mph").font(.caption).foregroundColor(.white)
                Text("☂ 100%").font(.caption).foregroundColor(.white)
            }
            
            VStack(alignment: .leading,spacing:5) {
                Text("\(temp)°").font(.largeTitle).fontWeight(.semibold).foregroundColor(.white)
                Text("Feels like \(feelsLike)°").font(.caption).foregroundColor(.white)
                Spacer().frame(height: 5)
                HStack(spacing: 5){
                    Text("↑ \(temp_max)°").font(.caption).foregroundColor(.white)
                    Text("↓ \(temp_min)°").font(.caption).foregroundColor(.white)
                }
            }
            
        }//.frame(alignment: .trailing)
        
        
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
