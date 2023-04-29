//
//  ContentView.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI
import KamaalNavigation

struct ContentView: View {
    var body: some View {
        NavigationStackView(
            stack: [] as [Screens],
            root: { screen in MainView(screen: screen) },
            subView: { screen in MainView(screen: screen, displayMode: .inline) },
            sidebar: { Sidebar() })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
