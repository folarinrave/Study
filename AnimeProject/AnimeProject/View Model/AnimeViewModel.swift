//
//  AnimeViewModel.swift
//  AnimeProject
//
//  Created by Daniel Brannon on 10/29/21.
//
import Foundation
class AnimeViewModel {
    var anime: AnimeModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateUI?()
            }
        }
    }
    
    var updateUI: (() -> Void)?
    var networkService = NetworkingRequest()
    
    init() {
        networkService.fetch { anime in
            self.anime = anime
        }
    }
    
    func bind(closure: @escaping () -> Void) {
        updateUI = closure
    }
    
    
    

}
