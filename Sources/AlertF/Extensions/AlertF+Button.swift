//  Created by Fabio Floris on 09/05/23.
//

import Foundation
import SwiftUI

extension AlertF {
    enum ButtonType { case done, cancel, destructive }
}
 
private typealias AlertButton = Button

extension AlertF {
    
    public struct Button: View {
         var text: Text
         var buttonType: AlertF.ButtonType
         var action: (() -> Void)?
        
        private init(text: Text, buttonType: AlertF.ButtonType, action: (() -> Void)? = {}) {
            self.text = text
            self.buttonType = buttonType
            self.action = action
        }
        
        public var body: some View {
            AlertButton { action?() } label: { text }
        }
        
        static func done(text: Text, action: (() -> Void)? = {}) -> AlertF.Button {
            AlertF.Button(text: text, buttonType: .done, action: action)
        }
        
        static func cancel(text: Text, action: (() -> Void)? = {}) -> AlertF.Button {
            AlertF.Button(text: text, buttonType: .cancel, action: action)
        }
        
        static func destructive(text: Text, action: (() -> Void)? = {}) -> AlertF.Button {
            AlertF.Button(text: text, buttonType: .destructive, action: action)
        }
    }
}
