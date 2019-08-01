//
//  FetchPokemonDetailsOperation.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/31/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
import UIKit

class FetchPokemonDetailsOperation: ConcurrentOperation {
    
    var baseURL = URL(string: "https://raw.githubusercontent.com/pokemongo-dev-contrib/pokemongo-game-master/master/versions/latest/GAME_MASTER.json")!
    
    private(set) var pokemon: Pokemon?
    private var dataTask: URLSessionDataTask?
    private let session: URLSession
    
    let pokemonName: String
    
    init(pokemonName: String, session: URLSession = URLSession.shared) {
        self.pokemonName = pokemonName
        self.session = session
        super.init()
    }
    
    
    override func start() {
        super.start()
        state = .isExecuting
        
        
        let task = session.dataTask(with: baseURL) { (data, response, error) in
            defer { self.state = .isFinished }
            if self.isCancelled { return }
         
            if let error = error {
                NSLog("Error fetching pokemon details: \(error)")
                return
            }
            
            guard let data = data else {
                NSLog("No data returned when fetching pokmeon details")
                return
            }
            
            do {
                
                let results = try JSONDecoder().decode(PokemonResults.self, from: data)
                let templates = results.itemTemplates
                let forms = templates.compactMap({ $0.formSettings })
                var formArray: [FormSettings] = []
                for form in forms {
                    if form.pokemon.contains(self.pokemonName) {
                        formArray.append(form)
                    }
                    
                }
                
                let details = templates.compactMap({ $0.pokemonSettings })
                var detailsArray: [PokemonSettings] = []
                for detail in details {
                    guard let id = detail.pokemonId else { continue }
                    if id.contains(self.pokemonName) {
                        detailsArray.append(detail)
                    }
                }
                
                let newPokemon = Pokemon(pokemonName: self.pokemonName, pokemonSettingsArray: detailsArray, formSettingsArray: formArray, sprites: nil)
                self.pokemon = newPokemon
                
                return
            } catch {
                NSLog("Error decoding pokemon: \(error)")
                return
            }
            
            
            
        }

        task.resume()
        dataTask? = task
    }
    
    
    override func cancel() {
        super.cancel()
        dataTask?.cancel()
    }
    
    
    
    
    
    
    
}

