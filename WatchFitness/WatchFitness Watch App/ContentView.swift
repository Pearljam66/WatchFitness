//
//  ContentView.swift
//  WatchFitness Watch App
//
//  Created by Sarah Clark on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var timerString = "00:00:00"
    @State private var bpm = 120
    @State private var calories = 110
    @State private var activity = "Running"

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack (alignment: .leading) {
            Text(timerString)
                .font(.title2)
                .foregroundColor(Color.yellow)
                .padding(.bottom)
                .onReceive(timer) {time in
                counter += 1

                let hours = counter / 3600
                let minutes = (counter % 3600) / 60
                let seconds = counter % 3600 % 60

                timerString = String(format: "%02d", hours) + ":" + String(format: "%02d", minutes) + ":" + String(format:"%02d", seconds)
            }

            Text("00:15:42")
            Text("120 BPM")
            Text("110 kcal")
            Text("Running")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
