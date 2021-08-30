//
//  WeatherMoodView.swift
//  HowYouDoing
//
//  Created by V, Kalaivani V. (623-Extern) on 30/08/21.
//

import SwiftUI

struct WeatherMoodView: View {
    var body: some View {
        VStack(spacing: 3) {
            Image(systemName: "cloud.sun.rain.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
            Text("Delhi").font(.caption).foregroundColor(.white)
        }
    }
}

struct WeatherMoodView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherMoodView()
    }
}
