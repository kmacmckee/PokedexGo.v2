//
//  PokemonType.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/31/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
import UIKit

struct PokemonType: Codable {
    
    var attackType: String
    var attackScalar: [Double]
    
    var typeNames = ["POKEMON_TYPE_NORMAL",
                     "POKEMON_TYPE_FIGHTING",
                     "POKEMON_TYPE_FLYING",
                     "POKEMON_TYPE_POISON",
                     "POKEMON_TYPE_GROUND",
                     "POKEMON_TYPE_ROCK",
                     "POKEMON_TYPE_BUG",
                     "POKEMON_TYPE_GHOST",
                     "POKEMON_TYPE_STEEL",
                     "POKEMON_TYPE_FIRE",
                     "POKEMON_TYPE_WATER",
                     "POKEMON_TYPE_GRASS",
                     "POKEMON_TYPE_ELECTRIC",
                     "POKEMON_TYPE_PSYCHIC",
                     "POKEMON_TYPE_ICE",
                     "POKEMON_TYPE_DRAGON",
                     "POKEMON_TYPE_DARK",
                     "POKEMON_TYPE_FAIRY"]
    
    var damageScalars: [String : Double] = [:]
    
    
}
