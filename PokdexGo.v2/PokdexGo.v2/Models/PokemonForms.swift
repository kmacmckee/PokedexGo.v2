//
//  PokemonForms.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

struct PokemonForms: Codable {

    var pokemonName: String
    var forms: [Forms]?
    
    enum CodingKeys: String, CodingKey {
        case pokemonName = "pokemon"
    }
    
    struct Forms: Codable {
        var form: String
    }
}

