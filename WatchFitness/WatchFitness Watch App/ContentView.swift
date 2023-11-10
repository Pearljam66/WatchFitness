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

    func endButtonPressed() {
        print("End button has been pressed.")
    }
    func lockButtonPressed() {
        print("Lock button has been pressed.")
    }

    func newButtonPressed() {
        print("New button has been pressed")
    }

    func pauseButtonPressed() {
        print("Pause button has been pressed.")
    }

    var body: some View {
        TabView {
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

                Text(String(bpm) + " BPM")
                Text(String(calories) + " kcal")
                Text(activity)
            }
            .padding()

            VStack {
                HStack {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .foregroundColor(.lockColorBackground)
                                .frame(width: 70, height: 64)
                            Image(systemName: "drop.fill")
                                .resizable()
                                .foregroundColor(.lock)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16)
                        }
                        Text("Lock")
                    }
                    .onTapGesture {
                        lockButtonPressed()
                    }

                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.newColorBackground)
                                    .frame(width: 70, height: 64)
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.new)
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 32)
                            }
                            Text("New")
                        }
                        .onTapGesture {
                            newButtonPressed()
                        }
                    }

                HStack {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .foregroundColor(.endColorBackground )
                                .frame(width: 70, height: 64)

                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.end)
                                .aspectRatio( 1.0, contentMode: .fit )
                                .frame( width: 32 )
                        }
                        Text("End")
                    }
                    .onTapGesture {
                        endButtonPressed()
                    }

                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .foregroundColor(.pauseColorBackground)
                                .frame(width: 70, height: 64)
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.pause)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 32)
                        }
                        Text("Pause")
                    }
                    .onTapGesture {
                        pauseButtonPressed()
                    }
                }
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    ContentView()
}
