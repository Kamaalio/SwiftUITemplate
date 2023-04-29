//
//  Item.swift
//
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import Foundation

public struct Item: Identifiable, Hashable {
    public let id: UUID

    public init(id: UUID) {
        self.id = id
    }
}
