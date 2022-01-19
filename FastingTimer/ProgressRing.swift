//
//  ProgressRing.swift
//  FastingTimer
//
//  Created by Fernando Bosco on 19/01/22.
//

import SwiftUI

struct ProgressRing: View {
    @State var progress = 0.0
    var body: some View {
        ZStack{
            Circle().stroke(lineWidth: 20).foregroundColor(.gray).opacity(0.1)
            
            Circle().trim(from: 0.0, to: min(progress,1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(.red), Color(.blue)]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                VStack(spacing: 5) {
                    Text("elapsed time").opacity(0.7)
                    Text("0:00").font(.title).fontWeight(.bold)
                }
                VStack(spacing: 5) {
                    Text("remaining time").opacity(0.7)
                    Text("0:00").font(.title).fontWeight(.bold)
                }
            }
            
            
        }.frame(width: 250, height: 250).padding().onAppear {
            progress = 1
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
.previewInterfaceOrientation(.portrait)
    }
}
