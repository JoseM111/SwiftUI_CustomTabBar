import SwiftUI

struct SFSymbolUIScreen: View {
    /// MARK: - ™PROPERTIES™
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    var sfSymbol: String
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    
    // MARK: -∆  body •••••••••
    var body: some View {
        
        //™ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        HStack {
            
            Image(systemName: sfSymbol)
                .resizable()
                .frame(width: 45, height: 40)
                .font(.system(size: 20, weight: .medium))
        }
        //™ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    }
}
// MARK: END OF: SFSymbolUIScreen
