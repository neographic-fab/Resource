//  Created by Fabio Floris on 09/05/23.
//

import Foundation
import SwiftUI

public extension AlertF {
        
     struct Settings {
        var buttons: AlertF.Settings.Buttons = AlertF.Settings.Buttons()
        var title: AlertF.Settings.Title = AlertF.Settings.Title()
        var message: AlertF.Settings.Message = AlertF.Settings.Message()
        var box: AlertF.Settings.Box = AlertF.Settings.Box()
    }
}

extension AlertF.Settings {
    
    struct Box {
        var backgroundColor: Color
        var shadowColor: Color
        var shadowRadius: CGFloat
        var cornerRadius: CGFloat
        
        init(backgroundColor: Color = .white, shadowColor: Color = .gray, shadowRadius: CGFloat = 10, cornerRadius: CGFloat = 10) {
            self.backgroundColor = backgroundColor
            self.shadowColor = shadowColor
            self.shadowRadius = shadowRadius
            self.cornerRadius = cornerRadius
        }
    }
}

 extension AlertF.Settings {
    
     struct Title {
        var textColor: Color
        var font: Font
        var textAlignment: TextAlignment
        
        init(textColor: Color = .black, font: Font = .title3.bold(), textalignment: TextAlignment = .center) {
            self.textColor = textColor
            self.font = font
            self.textAlignment = textalignment
        }
    }
}

extension AlertF.Settings {
    
    struct Message {
        var textColor: Color
        var font : Font
        var textAlignment: TextAlignment
        
        init(textColor: Color = .black, font: Font = .body, textAlignment: TextAlignment = .center) {
            self.textColor = textColor
            self.font = font
            self.textAlignment = textAlignment
        }
    }
}

extension AlertF.Settings {
    
    struct Buttons {
        var buttonColor: Color
        var textColor: Color
        var font: Font
        
        init(buttonColor: Color = .clear, textColor: Color = .blue, font: Font = .body) {
            self.buttonColor = buttonColor
            self.textColor = textColor
            self.font = font
        }
    }
}
