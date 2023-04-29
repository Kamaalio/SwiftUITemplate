//
//  MainView.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI
import KamaalUI
import KamaalPopUp
import KamaalNavigation

struct MainView: View {
    @StateObject private var popperUpManager = KPopUpManager(config: .init())

    let screen: Screens
    let displayMode: DisplayMode

    init(screen: Screens, displayMode: DisplayMode? = nil) {
        self.screen = screen
        self.displayMode = displayMode ?? (screen.isSidebarItem && screen.isTabItem ? .large : .inline)
    }

    var body: some View {
        KJustStack {
            switch screen {
            case .home:
                HomeScreen()
            }
        }
        .ktakeSizeEagerly()
        .navigationTitle(title: screen.title, displayMode: displayMode)
        .withKPopUp(popperUpManager)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(screen: .home)
    }
}
