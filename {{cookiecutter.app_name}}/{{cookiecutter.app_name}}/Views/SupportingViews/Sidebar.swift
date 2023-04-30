//
//  Sidebar.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI
import AppLocales
import KamaalNavigation

struct Sidebar: View {
    var body: some View {
        List {
            Section(AppLocales.getText(.SCENES)) {
                ForEach(Screens.allCases.filter(\.isSidebarItem), id: \.self) { screen in
                    StackNavigationChangeStackButton(destination: screen) {
                        Label(screen.title, systemImage: screen.imageSystemName)
                            .foregroundColor(.accentColor)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        #if os(macOS)
        .toolbar(content: {
            Button(action: toggleSidebar) {
                Label(AppLocales.getText(.TOGGLE_SIDEBAR), systemImage: "sidebar.left")
                    .foregroundColor(.accentColor)
            }
            .help(AppLocales.getText(.TOGGLE_SIDEBAR))
        })
        #endif
    }

    #if os(macOS)
    private func toggleSidebar() {
        guard let firstResponder = NSApp.keyWindow?.firstResponder else { return }
        firstResponder.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    #endif
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
