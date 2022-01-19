import SwiftUI

struct ContentView: View {
    var body: some View {
        Color(#colorLiteral(red: 0.04679945856, green: 0.04681556672, blue: 0.0467973426, alpha: 1))
                .ignoresSafeArea()
        
        content
    }
    
    var content: some View {
        VStack {
            
            Text("Let's get started ")
                .font(.headline)
                .foregroundColor(.red)
            
            Text("16:8")
                .fontWeight(.bold)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(.thinMaterial)
                .cornerRadius(20)
            ProgressRing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
