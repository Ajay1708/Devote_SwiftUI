//
//  ListRowItemView.swift
//  Devote_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 04/12/22.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded, weight: .heavy))
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default)
        } //: TOGGLE
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) { _ in
            if viewContext.hasChanges{
                try? viewContext.save()
            }
        }
    }
}
