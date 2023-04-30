//
//  AppSettingsScreen.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI
import KamaalSettings

struct AppSettingsScreen: View {
    @EnvironmentObject private var userData: UserData

    var body: some View {
        SettingsScreen(configuration: userData.settingsConfiguration)
    }
}

struct AppSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsScreen()
    }
}
