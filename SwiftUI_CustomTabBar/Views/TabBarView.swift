import SwiftUI

struct TabBarView {
    // MARK: - ™PROPERTIES™
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    @Binding var indexOf: Int
    //™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━«
    let sfSymbolList: [String] = [
        //∆..........
        "house.circle", "rectangle.stack.person.crop",
        "bell.circle", "appletv"
    ]
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    
}
// MARK: END OF: TabBarUIScreen

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

extension TabBarView: View {
    
    // MARK: ™━━━━━━━━━━━━ [body] ━━━━━━━━━━━━™
    var body: some View {
        
        //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        HStack(spacing: 8, content: {
            
            ForEach(0...3, id: \.self) { index in
                //∆..........
                switch index {
                //∆..........
                case 0:
                    GenTabUIScreen(
                        indexOf: $indexOf, num: index, sfSymbolList: sfSymbolList[index],
                        indexOfStr: "Home", fgColor: .twitterBlue2,
                        bgColor: .neonYellow)
                        // MARK: - onTapGesture
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                        .onTapGesture { indexOf = 0 }
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                //∆..........
                case 1:
                    GenTabUIScreen(
                        indexOf: $indexOf, num: index, sfSymbolList: sfSymbolList[index],
                        indexOfStr: "Personal", fgColor: .netflixRed,
                        bgColor: .white)
                        // MARK: - onTapGesture
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                        .onTapGesture { indexOf = 1 }
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                //∆..........
                case 2:
                    GenTabUIScreen(
                        indexOf: $indexOf, num: index, sfSymbolList: sfSymbolList[index],
                        indexOfStr: "Alert", fgColor: .white,
                        bgColor: .netflixRed)
                        // MARK: - onTapGesture
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                        .onTapGesture { indexOf = 2 }
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                //∆..........
                case 3:
                    GenTabUIScreen(
                        indexOf: $indexOf, num: index, sfSymbolList: sfSymbolList[index],
                        indexOfStr: "Apple      TV", fgColor: .purple,
                        bgColor: .black)
                        // MARK: - onTapGesture
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                        .onTapGesture { indexOf = 3 }
                        //™™|━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                //∆..........
                default:
                    SFSymbolUIScreen(sfSymbol: sfSymbolList[index])
                        .foregroundColor(Color(.lightGray))
                    
                    Text(indexOf == 0 ? "Home": "")
                        .fontWeight(.light)
                        .font(.system(size: 16))
                        .foregroundColor(.blue)
                }
                /// ∆ END OF: switch-statement
            }
            /// ∆ END OF: HStack
            .padding(.bottom, 20)
        })
        // MARK: ||END__PARENT-HSTACK||
        .padding(.top, 8)
        .frame(width: FULL_UI_SCREEN_WIDTH, height: 120)
        .background(Color.lightBlack)
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
        //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    }
    // MARK: |||END OF: body|||
}
// MARK: END OF: TabBarUIScreen
/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// MARK: - Preview ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
struct TabBarUIScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TabBarView(indexOf: .constant(3))//.padding(.all, 100)
            //.preferredColorScheme(.dark)
            //.previewLayout(.sizeThatFits)
            //.previewLayout(.fixed(width: 360, height: 720))
            // The preview below is for like a card
            .previewLayout(.fixed(width: 480, height: 270))
    }
}

