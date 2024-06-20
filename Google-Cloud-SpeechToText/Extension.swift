//
//  Extension.swift
//  Google-Cloud-SpeechToText
//
//  Created by Abdullah Kardaş on 20.06.2024.
//

import Foundation
import SwiftUI

extension View {
    func onTapWithBounce(bounce:Double = 0.92, onClick:@escaping () -> Void) -> some View {
        modifier(bounceModifier(bounce:bounce,onClick: onClick))
    }
}


struct bounceModifier:ViewModifier {
    let bounce:Double
    let onClick:() -> Void
    @State private var isPressed = false
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? bounce : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.4), value: isPressed)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0).onChanged({ _ in
                    
                    isPressed = true
                }).onEnded({ drag in
                    isPressed = false

                    if abs(drag.translation.width) < 30,abs(drag.translation.height) < 30 {
                        onClick()
                    }
                })
                )
        
    }
}
