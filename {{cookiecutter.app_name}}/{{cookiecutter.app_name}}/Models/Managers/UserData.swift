//
//  UserData.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI
import AppLocales
import KamaalLogger
import KamaalSettings

private let logger = KamaalLogger(from: UserData.self)

final class UserData: ObservableObject {
    @Published private var showLogs = true
    @Published private var appColor = AppColor(
        id: UUID(uuidString: "d3256bc6-84a4-4717-a970-9d2d3a1724b4")!,
        name: AppLocales.getText(.DEFAULT_COLOR),
        color: Color("AccentColor")
    )

    var settingsConfiguration: SettingsConfiguration {
        .init(
            feedback: .none,
            color: colorConfiguration,
            acknowledgements: AcknowledgementsJSON.shared.content,
            showLogs: showLogs
        )
    }

    private var colorConfiguration: SettingsConfiguration.ColorsConfiguration {
        .init(colors: [appColor], currentColor: appColor)
    }
}
