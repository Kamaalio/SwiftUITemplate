//
//  BaseProperties.swift
//  
//
//  Created by {{cookiecutter.full_name}} on {{cookiecutter.creation_date}}.
//

import KamaalCoreData

let baseProperties: [ManagedObjectPropertyConfiguration] = [
    ManagedObjectPropertyConfiguration(name: "updateDate", type: .date, isOptional: false),
    ManagedObjectPropertyConfiguration(name: "kCreationDate", type: .date, isOptional: false),
    ManagedObjectPropertyConfiguration(name: "id", type: .uuid, isOptional: false),
]
