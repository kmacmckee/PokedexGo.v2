//
//  PokedexAPI.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
import UIKit

class PokedexAPI {
    
    
    var baseURL = URL(string: "https://raw.githubusercontent.com/pokemongo-dev-contrib/pokemongo-game-master/master/versions/latest/GAME_MASTER.json")!
    
    var pokemons: [Pokemon]?
    
    func fetchPokemonNames(completion: @escaping ([String]?, Error?) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching Pokemon: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                NSLog("No data returned when fetching Pokemon")
                completion(nil, NSError())
                return
            }
            
            do {
                let results = try JSONDecoder().decode(PokemonResults.self, from: data)
                let templates = results.itemTemplates
                let forms = templates.map({ $0.formSettings })
                
                var pokemonNames: [String] = []
                for form in forms {
                    guard let pokemonName = form?.pokemon else { continue }
                    pokemonNames.append(pokemonName)
                }
                completion(pokemonNames, nil)
                return
                
                
            } catch {
                NSLog("Error parsing results JSON: \(error)")
                completion(nil, error)
                return
            }
            
        }
        
        dataTask.resume()
    }
    
    
    
//    func fetchPokemonDetails(pokemonName: String, completion: @escaping (Pokemon?, Error?) -> Void) {
//        
//        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
//            
//            if let error = error {
//                NSLog("Error fetching pokemon details for \(pokemonName): \(error)")
//                completion(nil, error)
//                return
//            }
//            
//            guard let data = data else {
//                NSLog("No data returned for pokemon (\(pokemonName)) details")
//                completion(nil, NSError())
//                return
//            }
//            
//            do {
//                let results = try JSONDecoder().decode(PokemonResults.self, from: data)
//                let templates = results.itemTemplates
//                let forms = templates.compactMap({ $0.formSettings })
//                var formArray: [FormSettings] = []
//                for form in forms {
//                    if form.pokemon.contains(pokemonName) {
//                        formArray.append(form)
//                    }
//                    
//                }
//                
//                let details = templates.compactMap({ $0.pokemonSettings })
//                var detailsArray: [PokemonSettings] = []
//                for detail in details {
//                    guard let id = detail.pokemonID else { continue }
//                    if id.contains(pokemonName) {
//                        detailsArray.append(detail)
//                    }
//                }
//                
//                let newPokemon = Pokemon(pokemonName: pokemonName, pokemonSettingsArray: detailsArray, formSettingsArray: formArray)
//                self.pokemons?.append(newPokemon)
//                completion(newPokemon, nil)
//                return
//            } catch {
//                NSLog("Error decoding pokemon: \(error)")
//                completion(nil, error)
//                return
//            }
//        }
//        dataTask.resume()
//   
//    }

    
    
//    func fetchPokemonType(pokemon: Pokemon, completion: @escaping ([PokemonType]?, Error?) -> Void) {
//        
//        var type1String: String = ""
//        var type2String: String = ""
//        
//        if let type1 = pokemon.pokemonSettingsArray?.first?.type {
//            type1String = type1
//        }
//        if let type2 = pokemon.pokemonSettingsArray?.first?.type2 {
//            type2String = type2
//        }
//        
//        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
//            
//                if let error = error {
//                    NSLog("Error fetching typing: \(error)")
//                    completion(nil, error)
//                    return
//                }
//    
//                guard let data = data else {
//                    NSLog("No data returned for type")
//                    completion(nil, NSError())
//                    return
//                }
//            
//            do {
//                let results = try JSONDecoder().decode(PokemonResults.self, from: data)
//                let templates = results.itemTemplates
//                let types = templates.compactMap({ $0.typeEffective })
//                
//                var returnTypes: [PokemonType] = []
//                
//                for type in types {
//                    if type.attackType == type1String {
//                        returnTypes.append(type)
//                    }
//                    if type2String != "" {
//                        if type.attackType == type2String {
//                            returnTypes.append(type)
//                        }
//                    }
//                    
//                }
//                completion(returnTypes, nil)
//                return
//                
//            } catch {
//                NSLog("Error decoding pokemon types: \(error)")
//                completion(nil, error)
//                return
//            }
//        }
//        dataTask.resume()
//    }
    
    

    
    
}


