//
//  MainPagePresenter.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 13.11.2023.
//

import Foundation

protocol MainPagePresenterInput {
    
}

protocol MainPagePresenterOutput: AnyObject {

}

class MainPagePresenter {
    weak var view: MainPageViewInput!
    var interactor: MainPageInteractorInput!
    var router: MainPageRouter!
}

extension MainPagePresenter: MainPageViewOutput {
    var dataSouce: [CharacterModel] {
        get {
            
        }
        set {
            
        }
    }
    
    func obtainCharacters() {
        view.showIndicator()
        interactor.loadCharacters()
    }
}

extension MainPagePresenter: MainPageInteractorOutput {
    
    func showCharacters(_ data: AllCharactersModel) {
        
    }
    
    func showError(_ error: Error) {
        
    }
    
    
}
