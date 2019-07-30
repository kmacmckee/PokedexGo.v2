//
//  PokeDictionary.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation


struct PokeDictionary: Codable {
    
    var itemTemplates: [templates]
    
    
    
    struct templates: Codable {
        
        var id: String
        
        //var avatarCustomization: avatarCustomization?
        
        //var badgeSettings: badgeSettings?
        
        //var combatMove: combatMove?
        
        var pokemonForms: PokemonForms?
        
        //var typeEffective: typeEffective?
        
        //var itemSettings: itemSettings?
        
        var pokemon: Pokemon?
        
        //var moveSettings: moveSettings?
        
        //var weatherAffinities: weatherAffinities?
        
        enum CodingKeys: String, CodingKey {
            case id = "templateId"
            case pokemonForms = "formSettings"
            case pokemon = "pokemonSettings"
            
        }
        
    }
    
    
    
}
