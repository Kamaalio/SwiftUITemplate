//
//  Backend.swift
//
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import CDPersist
import Foundation

public class Backend {
    public let itemClient: DataClient<CoreItem>

    private init(preview: Bool) {
        self.itemClient = .init(context: preview ? .preview : .shared)
    }

    public static let shared = Backend(preview: false)

    public static let preview = Backend(preview: true)
}
