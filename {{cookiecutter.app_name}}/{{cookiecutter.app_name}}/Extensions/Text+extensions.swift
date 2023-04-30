//
//  Text+extensions.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI
import AppLocales

extension Text {
    init(localized key: AppLocales.Keys) {
        self.init(key.localized)
    }

    static func empty() -> Text {
        Text("")
    }
}
