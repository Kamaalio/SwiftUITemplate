//
//  Screens.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import AppLocales
import Foundation
import KamaalNavigation

enum Screens: Hashable, Codable, Identifiable, CaseIterable, NavigatorStackValue {
    case home

    var id: UUID {
        switch self {
        case .home:
            return UUID(uuidString: "1aad48ae-a16d-44e4-adb6-49b4b972be36")!
        }
    }

    var isTabItem: Bool {
        switch self {
        case .home:
            return true
        }
    }

    var isSidebarItem: Bool {
        switch self {
        case .home:
            return true
        }
    }

    var imageSystemName: String {
        switch self {
        case .home:
            return "house.fill"
        }
    }

    var title: String {
        switch self {
        case .home:
            return AppLocales.getText(.HOME)
        }
    }

    static var root: Screens = .home
}
