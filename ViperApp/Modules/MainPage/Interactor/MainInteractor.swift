//
//  MainInteractor.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 12.11.2023.
//

import Foundation

protocol MainPageInteractorInput {
    func loadCharacters()
}

protocol MainPageInteractorOutput: AnyObject {
    func showCharacters(_ data: AllCharactersModel)
    func showError(_ error: Error)
}



class MainPageInteractor {
    
    weak var presenter: MainPageInteractorOutput!
    private let networkService = NetworkService()
}

extension MainPageInteractor: MainPageInteractorInput {
    
    func loadCharacters() {
        networkService.getCharacter(for: AllCharactersModel.self) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                self.presenter.showCharacters(data)
            case .failure(let error):
                self.presenter.showError(error)
            }
            
        }
    }
}
