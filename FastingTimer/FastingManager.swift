import Foundation

enum FastingState {
    case notStarted
    case fasting
    case feeding
}

enum FastingPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    var festingPeriod: Double {
        switch self {
            
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
    
}

class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState  = .notStarted
    @Published private(set) var fastingPlan: FastingPlan  = .intermediate
    @Published private(set) var startTime: Date
    @Published private(set) var endTime: Date
    
    init() {
        let calendar = Calendar.current
        
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.hour = 20
        print(components)
        let scheduledTime = calendar.date(from: components) ?? Date.now
        print("schreduleTime",scheduledTime)
        startTime = scheduledTime 
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.festingPeriod)
    }
    
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
    }
}
