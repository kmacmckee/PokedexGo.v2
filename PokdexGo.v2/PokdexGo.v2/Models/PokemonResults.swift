//
//  PokemonResults.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/30/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//
import Foundation

struct PokemonResults: Codable {
    
    var itemTemplates: [Templates]
    var timestampMS: String?
}

struct Templates: Codable {
    
    let templateID: String?
    var combatMove: CombatMove?
    var formSettings: FormSettings?
    var pokemonSettings: PokemonSettings?
    //var typeEffective: PokemonType?
    
}



struct CombatMove: Codable {
    let uniqueID: String?
    let type: String
    let power: Int?
    let vfxName: String
    let energyDelta: Int?
    let buffs: Buffs?
    let durationTurns: Int?
}

// MARK: - Buffs
struct Buffs: Codable {
    let attackerAttackStatStageChange: Int?
    let attackerDefenseStatStageChange: Int?
    let buffActivationChance: Double
    let targetDefenseStatStageChange: Int?
    let targetAttackStatStageChange: Int?
}


struct FormSettings: Codable {
    var pokemon: String
    var forms: [Form]?
}

struct Form: Codable {
    let form: String
    let assetBundleValue: Int?
    let assetBundleSuffix: String?
}





struct Encounter: Codable {
    let baseCaptureRate: Double?
    let baseFleeRate: Double?
    let collisionRadiusM: Double
    let collisionHeightM: Double
    let collisionHeadRadiusM: Double
    let movementType: String?
    let movementTimerS: Int
    let jumpTimeS: Double?
    let attackTimerS: Int
    let attackProbability: Double?
    let dodgeProbability: Double?
    let dodgeDurationS: Double
    let dodgeDistance: Double
    let cameraDistance: Double
    let minPokemonActionFrequencyS: Double
    let maxPokemonActionFrequencyS: Double
    let bonusCandyCaptureReward: Int?
    let bonusStardustCaptureReward: Int?
}


struct EvolutionBranch: Codable {
    let evolution: String
    let candyCost: Int
    let form: String?
    let evolutionItemRequirement: String?
    let lureItemRequirement: String?
    let kmBuddyDistanceRequirement: Int?
    let mustBeBuddy: Bool?
    let onlyDaytime: Bool?
    let priority: Int?
    let onlyNighttime: Bool?
    let genderRequirement: String?
}


struct Stats: Codable {
    let baseStamina: Int
    let baseAttack: Int
    let baseDefense: Int
}


struct ThirdMove: Codable {
    let stardustToUnlock: Int?
    let candyToUnlock: Int
}


struct Shadow: Codable {
    let purificationStardustNeeded: Int
    let purificationCandyNeeded: Int
    let purifiedChargeMove: String
    let shadowChargeMove: String
}


