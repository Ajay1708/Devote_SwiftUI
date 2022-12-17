//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by Venkata Ajay Sai (Paras) on 17/12/22.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetLiveActivity()
    }
}
