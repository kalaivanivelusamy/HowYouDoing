

import SwiftUI

struct TemperatureView: View {
    
    var body: some View {
        
        HStack (spacing: 100){
            
            VStack {
                Spacer().frame(height: 50)

                Text("Humidity 75%").font(.caption).foregroundColor(.white)
                Text("8 mph").font(.caption).foregroundColor(.white)
                Text("☂ 100%").font(.caption).foregroundColor(.white)
            }
            
            VStack(alignment: .leading,spacing:5) {
                Text("33°").font(.largeTitle).fontWeight(.semibold).foregroundColor(.white)
                Text("Feels like 33°").font(.caption).foregroundColor(.white)
                Spacer().frame(height: 5)
                HStack(spacing: 5){
                    Text("↑ 36°").font(.caption).foregroundColor(.white)
                    Text("↓ 19°").font(.caption).foregroundColor(.white)
                }
            }
            
        }//.frame(alignment: .trailing)
        
        
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
