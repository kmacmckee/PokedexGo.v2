//
//  GameObjects.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation
import UIKit


struct GameObjects: Codable {
    
    var itemTemplates: [Templates]
    
    
    struct Templates: Codable {
        
        var spritesData: [Data]?
        
        var templateId: String
        
        //var avatarCustomization: avatarCustomization?
        
        //var badgeSettings: badgeSettings?
        
        //var combatMove: combatMove?
        
        var pokemonForms: PokemonForms?
        
        //var typeEffective: typeEffective?
        
        //var itemSettings: itemSettings?
        
        var pokemon: PokemonDetails?
        
        //var moveSettings: moveSettings?
        
        //var weatherAffinities: weatherAffinities?
        
        enum CodingKeys: String, CodingKey {
            case templateId
            case spritesData
            case pokemonForms = "formSettings"
            case pokemon = "pokemonSettings"
            
        }
        
    }
    
    
    
}
