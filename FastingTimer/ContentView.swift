import SwiftUI

struct ContentView: View {
    @StateObject var fastingManager = FastingManager()

    
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Lets get started"
        case .fasting:
            return "You're are now fasting"
        case .feeding:
            return "You're are now feeding"
        }
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.04679945856, green: 0.04681556672, blue: 0.0467973426, alpha: 1))
                .ignoresSafeArea()
            content
        }
        
    }
    
    var content: some View {
        
        VStack (spacing: 40) {
            
            Text(title)
                .font(.headline)
            
            Text(fastingManager.fastingPlan.rawValue)
                .fontWeight(.bold)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(.thinMaterial)
                .cornerRadius(20)
            
            ProgressRing()
            
            HStack(spacing: 30) {
                VStack(spacing: 5){
                    Text(fastingManager.fastingState == .notStarted ? "start": "started").opacity(0.7)
                    Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second()).fontWeight(.bold)
                }
                VStack(spacing: 5){
                    Text(fastingManager.fastingState == .notStarted ? "end": "ends").opacity(0.7)
                    
                    Text(fastingManager.endTime, format: .dateTime.weekday().hour().minute().second()).fontWeight(.bold)
                }
            }
            
            Button {
                fastingManager.toggleFastingState()
            } label:{
                
                Text(fastingManager.fastingState == .fasting ? "End Fasting": "Start fasting")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
            }
            
        }.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        ContentView()
        
    }
}
