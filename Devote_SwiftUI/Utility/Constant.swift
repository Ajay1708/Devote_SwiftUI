//
//  Constant.swift
//  Devote_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 22/10/22.
//

import SwiftUI
// MARK: - FORMATTER
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient{
    return LinearGradient(colors: [Color.pink,Color.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
}
// MARK: - UX
let feedback = UINotificationFeedbackGenerator()
