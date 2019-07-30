//
//  FetchPokemonDetailsOperation.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

class FetchPokemonDetailsOperation: ConcurrentOperation {
    
    private(set) var pokemonDetailsArray: [PokemonDetails]?
    private var dataTask: URLSessionDataTask?
    private var session: URLSession
    
    let pokemonName: String
    
    init(form: PokemonForms, session: URLSession = URLSession.shared) {
        self.pokemonName = form.pokemonName
        self.session = session
        super.init()
    }
    
    
    var baseURL = URL(string: "https://raw.githubusercontent.com/pokemongo-dev-contrib/pokemongo-game-master/master/versions/latest/GAME_MASTER.json")!
    
    override func start() {
        super.start()
        state = .isExecuting
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            defer { self.state = .isFinished }
            if self.isCancelled { return }
            
            if let error = error {
                NSLog("Error fetching pokemon: \(error)")

                return
            }
            
            guard let data = data else {
                NSLog("No data returned when fetching pokemon")
                return
            }
            
            do {
                let pokedexDict = try JSONDecoder().decode(GameObjects.self, from: data)
                let templates = pokedexDict.itemTemplates
                let pokemons = templates.compactMap({ $0.pokemon })
                
                var pokemonArray: [PokemonDetails] = []
                for pokemon in pokemons {
                    if pokemon.pokemonId.contains(self.pokemonName) {
                        pokemonArray.append(pokemon)
                    }
                }
                
                self.pokemonDetailsArray = pokemonArray
                
            } catch {
                NSLog("Error decoding pokedex dictionary: \(error)")
                
                return
            }
        }
        dataTask.resume()
        
    }
    
    
    
    
}
