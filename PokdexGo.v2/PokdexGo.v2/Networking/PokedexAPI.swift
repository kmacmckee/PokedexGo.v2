//
//  PokedexAPI.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

class PokedexAPI {
    
    var baseURL = URL(string: "https://raw.githubusercontent.com/pokemongo-dev-contrib/pokemongo-game-master/master/versions/latest/GAME_MASTER.json")!
    
    var pokedex: PokeDictionary?
    var pokemons: [Pokemon]?
    var forms: [PokemonForms]?
    
    func fetchPokedex() {
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let error = error {
                NSLog("Error fetching pokemon: \(error)")
                print(error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned when fetching pokemon")
                print(NSError())
                return
            }
            
            do {
                let pokedexDict = try JSONDecoder().decode(PokeDictionary.self, from: data)
                self.pokedex = pokedexDict
                
            } catch {
                NSLog("Error decoding pokedex dictionary: \(error)")
                return
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
    
    func fetchPokemon(completion: @escaping ([Pokemon]?, Error?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let error = error {
                NSLog("Error fetching pokemon: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned when fetching pokemon")
                return
            }
            
            do {
                let pokedexDict = try JSONDecoder().decode(PokeDictionary.self, from: data)
                let templates = pokedexDict.itemTemplates
                let pokemon = templates.compactMap({ $0.pokemon })
                self.pokemons = pokemon
                print(pokemon.count)
                completion(pokemon, nil)
                
            } catch {
                NSLog("Error decoding pokedex dictionary: \(error)")
                completion(nil, error)
                return
            }
        }
        dataTask.resume()
    }

    
    func fetchPokemonForms(completion: @escaping ([PokemonForms]?, Error?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let error = error {
                NSLog("Error fetching pokemon: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned when fetching pokemon")
                return
            }
            
            do {
                let pokedexDict = try JSONDecoder().decode(PokeDictionary.self, from: data)
                let templates = pokedexDict.itemTemplates
                let pokemonForms = templates.compactMap({ $0.pokemonForms })
                self.forms = pokemonForms
                completion(pokemonForms, nil)
                
            } catch {
                NSLog("Error decoding pokedex dictionary: \(error)")
                completion(nil, error)
                return
            }
        }
        dataTask.resume()
        
    }
    
    
    
    func fetchTypeEffectiveness() {
        
    }
    
    func fetchMoveDetails() {
        
    }
    
    
    
}


