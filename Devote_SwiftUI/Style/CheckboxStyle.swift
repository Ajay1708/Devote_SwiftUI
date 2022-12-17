//
//  CheckboxStyle.swift
//  Devote_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 04/12/22.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                        playSound(sound: configuration.isOn ? "sound-rise" : "sound-tap", type: "mp3")
                    feedback.notificationOccurred(.success)
                }
            configuration.label
        }//: HSTACK
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("PlaceholderLabel", isOn: .constant(true))
            .toggleStyle(CheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
