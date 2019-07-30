//
//  PokemonDetails.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

struct PokemonDetails: Codable {
    
    var pokemonId: String
    var type: String
    var type2: String?
    var familyId: String?
    var form: String?
    
    var stats: Stats?
    
    var quickMoves: [String]?
    
    var cinematicMoves: [String]?
    
    var evolutionBranch: [Evolutions]?
    
    var thirdMove: ThirdMove?
    
    var pokemonForms: PokemonForms?
    
    
    struct Stats: Codable {
        var baseStamina: Int
        var baseAttack: Int
        var baseDefense: Int
        
    }
    
    struct Evolutions: Codable {
        var evolution: String?
        var candyCost: Int?
        var form: String?
    }
    
    struct ThirdMove: Codable {
        var stardustToUnlock: Int?
        var candyToUnlock: Int?
    }
    
    
    
}
