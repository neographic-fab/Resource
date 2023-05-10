//  Created by Fabio Floris on 09/05/23.
//

import Foundation
import SwiftUI

private struct AlertFContentView<Contents: View> : ViewModifier {
    @Binding var isPresented: Bool
    var content: Contents
    private let transition = AnyTransition.scale(scale: 1.2).combined(with: .opacity).animation(.easeOut(duration: 0.15))
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                if isPresented {
                    self.content.transition(transition)
                } else {
                    Spacer()
                }
            }
        }
    }
}

extension View {
    public func alertF(isPresented: Binding<Bool>, content: () -> AlertF) -> some View {
        self.modifier(AlertFContentView(isPresented: isPresented, content: content()))
    }
}
