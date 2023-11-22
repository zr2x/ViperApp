//
//  CharacterModel.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 12.11.2023.
//

import Foundation

struct AllCharactersModel: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [CharacterModel]
}

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let gender: CharacterGender
    let image: String
}
