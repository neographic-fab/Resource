//  Created by Fabio Floris on 09/05/23.
//

import Foundation
import SwiftUI

public struct AlertF: View {
    
    private var title: Text
    private var message: Text
    private var buttons: [AlertF.Button]?
    private var settings: AlertF.Settings = AlertF.Settings()

    @State private var disabledScroll: Bool = false
    @State private var contentSize: CGSize = .zero
    
    public init(title: Text, message: Text, buttons: [AlertF.Button]? = nil) {
        self.title = title
        self.message = message
        self.buttons = buttons
        
        if self.buttons == nil {
            self.buttons = [.done(text: Text("Done"))]
        }
    }
    
    public var body: some View {
        GeometryReader { mainReader in
            ZStack {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    title
                        .padding(.top, 30)
                        .font(settings.title.font)
                        .foregroundColor(settings.title.textColor)
                        .multilineTextAlignment(settings.title.textAlignment)
                    
                    ScrollView {
                        message
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .multilineTextAlignment(settings.message.textAlignment)
                            .font(settings.message.font)
                            .foregroundColor(settings.message.textColor)
                            .overlay {
                                GeometryReader { reader in
                                    Color.clear.onAppear {
                                        contentSize = reader.size
                                        disabledScroll = contentSize.height > mainReader.size.height * 0.7 ? false : true
                                    }
                                    Color.clear.onChange(of: message) { _ in
                                        contentSize = reader.size
                                        
                                        disabledScroll = contentSize.height > mainReader.size.height * 0.7 ? false : true
                                    }
                                }
                            }
                    }
                    .frame(maxHeight: contentSize.height >= mainReader.size.height * 0.7 ? mainReader.size.height * 0.7 : contentSize.height)
                    .disabled(disabledScroll)
                    .padding(.horizontal, 20)
                    
                    Divider().padding(.horizontal)

                    if let buttons = buttons {
                        makeButtons(buttons)
                    }
                }
                .background(settings.box.backgroundColor)
                .cornerRadius(settings.box.cornerRadius)
                .shadow(color: settings.box.shadowColor, radius: settings.box.shadowRadius)
                .padding(.horizontal, 20)
            }
        }
    }
}

private extension AlertF {
    @ViewBuilder
    func makeButtons(_ buttons: [AlertF.Button]) -> some View {
        HStack(spacing: 0) {
            ForEach(0...buttons.count - 1, id:\.self) { button in
                buttons[button]
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .font(buttons[button].buttonType == .done ? settings.buttons.font.bold() : settings.buttons.font)
                    .foregroundColor(settings.buttons.textColor)
                    .background(settings.buttons.buttonColor)
                
                if (buttons.last != nil) {
                    Divider().frame(height: 20)
                }
            }
        }
    }
}

