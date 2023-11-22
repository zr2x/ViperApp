//
//  FavouriteDataBase.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 22.11.2023.
//

import Foundation

final class FavouriteDataBase {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.setValue(array, forKey: FAV_KEY)
    }
    
    func get() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? []
        return Set(array)
    }
}
