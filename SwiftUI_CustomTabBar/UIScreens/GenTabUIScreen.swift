 import SwiftUI
 
 struct GenTabUIScreen: View {
    /// MARK: - ™PROPERTIES™
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    @Binding var indexOf: Int
    //™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━«
    var num: Int = 0
    var sfSymbolList: String
    var indexOfStr: String
    var fgColor: Color = .clear
    var bgColor: Color = .clear
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    
    // MARK: -∆  body •••••••••
    var body: some View {
        
        HStack(spacing: 0) {
            
            SFSymbolUIScreen(sfSymbol: sfSymbolList)
                .padding(.horizontal, 3)
                .foregroundColor(fgColor)
                .padding(8)
            
            Text(indexOf == num ? indexOfStr : "")
                .fontWeight(.semibold)
                .lineLimit(2)
                .font(.system(size: 12))
                .foregroundColor(fgColor)
                .padding(.trailing, 10)
                .fixedSize(horizontal: false, vertical: true)
        }
        .background(indexOf == num ? bgColor : Color.clear)
        .clipShape(Capsule())
    }
 }
 // MARK: END OF: GenTabUIScreen
 
 /// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 
 
