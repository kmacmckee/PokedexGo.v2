//
//  PokemonDetails.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

struct PokemonSettings: Codable {
    let pokemonId: String?
    let modelScale: Double
    let type: String?
    let type2: String?
    //let camera: PokemonSettingsCamera
    let encounter: Encounter
    let stats: Stats
    let quickMoves: [String]?
    let cinematicMoves: [String]?
    let animationTime: [Double]
    let evolutionIds: [String]?
    let evolutionPips: Int
    let pokedexHeightM: Double
    let pokedexWeightKg: Double
    let heightStdDev: Double
    let weightStdDev: Double
    let familyId: String?
    let candyToEvolve: Int?
    let kmBuddyDistance: Int
    let modelHeight: Double
    let evolutionBranch: [EvolutionBranch]?
    let modelScaleV2: Double
    let buddyOffsetMale: [Double]
    let buddyOffsetFemale: [Double]
    let buddyScale: Int
    let thirdMove: ThirdMove
    let isTransferable: Bool?
    let isDeployable: Bool?
    let form: String?
    let shadow: Shadow?
    let parentPokemonId: String?
    let buddySize: String?
    let combatShoulderCameraAngle: [Double]?
    let combatDefaultCameraAngle: [Double]?
    let combatPlayerFocusCameraAngle: [Double]?
    let buddyPortraitOffset: [Double]?
    let combatPlayerPokemonPositionOffset: [Int]?
    let rarity: String?
    let combatOpponentFocusCameraAngle: [Double]?
    


    
}
