//
//  View+extensions.swift
//  {{cookiecutter.app_name}}
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import SwiftUI

extension View {
    func padding(_ edges: Edge.Set = .all, _ length: AppSizes) -> some View {
        padding(edges, length.rawValue)
    }

    func cornerRadius(_ length: AppSizes) -> some View {
        cornerRadius(length.rawValue)
    }
}
