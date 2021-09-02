


import SwiftUI

struct WeatherMoodView: View {
    
    var image: String
    
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Delhi").font(.caption).foregroundColor(.white)
        }
    }
}

struct WeatherMoodView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
