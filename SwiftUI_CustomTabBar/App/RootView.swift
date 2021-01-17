import SwiftUI

struct RootView {
    // MARK: - ™PROPERTIES™
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    @State var indexOf: Int = 0
    ///™━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
}
// MARK: END OF: ContentView

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

extension RootView: View {
    
    // MARK: ™━━━━━━━━━━━━ [body] ━━━━━━━━━━━━™
    var body: some View {
        
        //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        VStack {
            
            // MARK: -∆  Color when tab is pressed  ━━━━━━━━━━━━━━━━━━━
            ZStack {
                
                /// ™ if 👇 {
                indexOf == 0
                    ? Color.twitterBlue2.edgesIgnoringSafeArea(.top)
                    : indexOf == 1
                    ? Color.netflixRed.edgesIgnoringSafeArea(.top)
                    : indexOf == 2
                    ? Color.black.edgesIgnoringSafeArea(.top)
                    /// ™ else {
                    : Color.darkPurple.edgesIgnoringSafeArea(.top)
                /// ™ }
            }
            /// ∆ END OF: ZStack
            
            // MARK: -∆  TabBarView  ━━━━━━━━━━━━━━━━━━━
            TabBarView(indexOf: $indexOf)
                .padding(.vertical, -40)
            
        }
        // MARK: ||END__PARENT-VSTACK||
        .animation(.spring())
        //━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    }
    // MARK: |||END OF: body|||
}
// MARK: END OF: ContentView

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// MARK: - Preview ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        RootView()//.padding(.all, 100)
        //.preferredColorScheme(.dark)
        //.previewLayout(.sizeThatFits)
        //.previewLayout(.fixed(width: 360, height: 720))
        // The preview below is for like a card
        //.previewLayout(.fixed(width: 440, height: 270))
    }
}

/// @━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// MARK: Helper Function
func iAmHere(myStr: String) -> some View {
    return Button(action: {  }) {
        //∆..... LABEL .....
        Text("\(myStr)")
    }
    .buttonStyle(PrimaryButtonStyle(
                    paddingAll: 20,
                    bgColorAlt: .netflixRed,
                    bgColor: .netflixRed, w: 200))
    .animation(.spring())
}
