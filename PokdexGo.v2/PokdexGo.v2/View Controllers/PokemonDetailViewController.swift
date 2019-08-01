//
//  PokemonDetailViewController.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit
import CoreGraphics

class PokemonDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var type2ImageView: UIImageView!
    @IBOutlet weak var type1ImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spriteImageView: UIImageView!
    
    @IBOutlet weak var quickMovesTableView: UITableView!
    @IBOutlet weak var cinematicMovesTableView: UITableView!
    
    
    var pokemon: Pokemon?
    var pokemonId: String?
    var sprites: [UIImage] = []
    var spriteIndex = 0
    var type1Icon: UIImage?
    var type1Bg: UIImage?
    var type2Icon: UIImage?
    var pokemonDetails: PokemonSettings?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemon = pokemon,
            let pokemonId = pokemonId else {
                NSLog("Error occured during ViewDidLoad")
                return
                
        }
        self.quickMovesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "QuickMoveCell")
        self.cinematicMovesTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CinematicMoveCell")
        quickMovesTableView.delegate = self
        cinematicMovesTableView.delegate = self
        quickMovesTableView.dataSource = self
        cinematicMovesTableView.dataSource = self
        quickMovesTableView.backgroundColor = .clear
        cinematicMovesTableView.backgroundColor = .clear
        
        print(pokemonId)
        getSprites(id: pokemonId)
        
        spriteImageView.isUserInteractionEnabled = true
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        spriteImageView.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        spriteImageView.addGestureRecognizer(swipeLeft)
        
        guard let pokeDetails = pokemon.pokemonSettingsArray?.first else { return }
        pokemonDetails = pokeDetails
        
        //getTypeImages(pokemon: pokemon)
    }
    
    func updateViews() {
        nameLabel.text = pokemon?.pokemonName
        spriteImageView.image = sprites[spriteIndex]
        spriteImageView.addShadow()
        
        getTypeDetails()
    
        
        view.backgroundColor = UIColor(displayP3Red: 0 / 255, green: 46 / 255, blue: 56 / 255, alpha: 1)
        type1ImageView.image = type1Icon
        type2ImageView.image = type2Icon
        backgroundImageView.image = type1Bg
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int?
        if tableView == self.quickMovesTableView {
            count = pokemonDetails?.quickMoves?.count
        }
        
        if tableView == self.cinematicMovesTableView {
            count = pokemonDetails?.cinematicMoves?.count
        }
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        guard let quickMoves = pokemonDetails?.quickMoves,
            let cinematicMoves = pokemonDetails?.cinematicMoves else { return UITableViewCell() }
        
        
        if tableView == self.quickMovesTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "QuickMoveCell", for: indexPath)
            let moveName = quickMoves[indexPath.row]
            let formattedMoveName = moveName.replacingOccurrences(of: "_", with: " ")
            let formattedMove = formattedMoveName.replacingOccurrences(of: "FAST", with: " ")
            
            cell?.textLabel!.text = formattedMove.capitalized
        }
        
        if tableView == self.cinematicMovesTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "CinematicMoveCell", for: indexPath)
            let moveName = cinematicMoves[indexPath.row]
            let formattedMoveName = moveName.replacingOccurrences(of: "_", with: " ")
            cell?.textLabel!.text = formattedMoveName.capitalized
        }
        
        cell?.backgroundColor = .clear
        cell?.textLabel?.textColor = .white
        return cell!
    }
    
    
    
    
    
    
    
    
    
    func getSprites(id: String) {
        self.sprites = []
        
        if let image1 = UIImage(named: "pokemon_icon_\(id)_00") { sprites.append(image1) }
        if let image2 = UIImage(named: "pokemon_icon_\(id)_00_shiny") { sprites.append(image2) }
        if let image3 = UIImage(named: "pokemon_icon_\(id)_01") { sprites.append(image3) }
        if let image4 = UIImage(named: "pokemon_icon_\(id)_01_shiny") { sprites.append(image4) }
        if let image5 = UIImage(named: "pokemon_icon_\(id)_02") { sprites.append(image5) }
        if let image6 = UIImage(named: "pokemon_icon_\(id)_02_shiny") { sprites.append(image6) }
        if let image7 = UIImage(named: "pokemon_icon_\(id)_03") { sprites.append(image7) }
        if let image8 = UIImage(named: "pokemon_icon_\(id)_03_shiny") { sprites.append(image8) }
        if let image9 = UIImage(named: "pokemon_icon_\(id)_04") { sprites.append(image9) }
        if let image10 = UIImage(named: "pokemon_icon_\(id)_04_shiny") { sprites.append(image10) }
        if let image11 = UIImage(named: "pokemon_icon_\(id)_05") { sprites.append(image11) }
        if let image12 = UIImage(named: "pokemon_icon_\(id)_05_shiny") { sprites.append(image12) }
        if let image13 = UIImage(named: "pokemon_icon_\(id)_06") { sprites.append(image13) }
        if let image14 = UIImage(named: "pokemon_icon_\(id)_06_shiny") { sprites.append(image14) }
        if let image15 = UIImage(named: "pokemon_icon_\(id)_07") { sprites.append(image15) }
        if let image16 = UIImage(named: "pokemon_icon_\(id)_07_shiny") { sprites.append(image16) }
        if let image17 = UIImage(named: "pokemon_icon_\(id)_08") { sprites.append(image17) }
        if let image18 = UIImage(named: "pokemon_icon_\(id)_08_shiny") { sprites.append(image18) }
        if let image19 = UIImage(named: "pokemon_icon_\(id)_09") { sprites.append(image19) }
        if let image20 = UIImage(named: "pokemon_icon_\(id)_09_shiny") { sprites.append(image20) }
        if let image21 = UIImage(named: "pokemon_icon_\(id)_11") { sprites.append(image21) }
        if let image22 = UIImage(named: "pokemon_icon_\(id)_11_shiny") { sprites.append(image22) }
        if let image23 = UIImage(named: "pokemon_icon_\(id)_12") { sprites.append(image23) }
        if let image24 = UIImage(named: "pokemon_icon_\(id)_12_shiny") { sprites.append(image24) }
        if let image25 = UIImage(named: "pokemon_icon_\(id)_13") { sprites.append(image25) }
        if let image26 = UIImage(named: "pokemon_icon_\(id)_13_shiny") { sprites.append(image26) }
        if let image27 = UIImage(named: "pokemon_icon_\(id)_14") { sprites.append(image27) }
        if let image28 = UIImage(named: "pokemon_icon_\(id)_14_shiny") { sprites.append(image28) }
        if let image29 = UIImage(named: "pokemon_icon_\(id)_15") { sprites.append(image29) }
        if let image30 = UIImage(named: "pokemon_icon_\(id)_15_shiny") { sprites.append(image30) }
        if let image31 = UIImage(named: "pokemon_icon_\(id)_16") { sprites.append(image31) }
        if let image32 = UIImage(named: "pokemon_icon_\(id)_16_shiny") { sprites.append(image32) }
        if let image33 = UIImage(named: "pokemon_icon_\(id)_61") { sprites.append(image33) }
        if let image34 = UIImage(named: "pokemon_icon_\(id)_61_shiny") { sprites.append(image34) }
        if let image35 = UIImage(named: "pokemon_icon_\(id)_61_01_shiny") { sprites.append(image35) }
        
        print(sprites.count)
        updateViews()
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if spriteIndex == sprites.count - 1 {
                    spriteIndex = 0
                } else {
                    spriteIndex += 1
                }
                spriteImageView.image = sprites[spriteIndex]
                spriteImageView.addShadow()
                
            case UISwipeGestureRecognizer.Direction.right:
                if spriteIndex == 0 {
                    spriteIndex = sprites.count - 1
                } else {
                    spriteIndex -= 1
                }
                spriteImageView.image = sprites[spriteIndex]
                spriteImageView.addShadow()
            default:
                break
            }
        }
    }
    
    
    
    func getTypeDetails() {
        guard let pokemonDetails = pokemon?.pokemonSettingsArray?.first else { return }
        var type1String: String?
        var type2String: String?
        
        if let type1 = pokemonDetails.type {
            let type1Array = type1.split(separator: "_")
            if let type1SubString = type1Array.last {
                type1String = String(type1SubString)
            }
        }
        
        if let type2 = pokemonDetails.type2 {
            let type2Array = type2.split(separator: "_")
            if let type2SubString = type2Array.last {
                type2String = String(type2SubString)
            }
        }
        
        if let type1Keyword = type1String?.capitalized {
            type1Icon = getTypeIcon(type: type1Keyword)
            type1Bg = getTypeBg(type: type1Keyword)
        }
        
        
        if let type2Keyword = type2String?.capitalized {
            type2Icon = getTypeIcon(type: type2Keyword)
        }
        
    }
    
    
    
    func getTypeIcon(type: String) -> UIImage {
    
        switch (type) {
        case "Bug":
            return AppearanceHelper.bugIcon
        case "Dark":
            return AppearanceHelper.darkIcon
        case "Dragon":
            return AppearanceHelper.dragonIcon
        case "Electric":
            return AppearanceHelper.electricIcon
        case "Fairy":
            return AppearanceHelper.fairyIcon
        case "Fighting":
            return AppearanceHelper.fightingIcon
        case "Fire":
            return AppearanceHelper.fireIcon
        case "Flying":
            return AppearanceHelper.flyingIcon
        case "Ghost":
            return AppearanceHelper.ghostIcon
        case "Grass":
            return AppearanceHelper.grassIcon
        case "Ground":
            return AppearanceHelper.groundIcon
        case "Ice":
            return AppearanceHelper.iceIcon
        case "Normal":
            return AppearanceHelper.normalIcon
        case "Poison":
            return AppearanceHelper.poisonIcon
        case "Psychic":
            return AppearanceHelper.psychicIcon
        case "Rock":
            return AppearanceHelper.rockIcon
        case "Steel":
            return AppearanceHelper.steelIcon
        case "Water":
            return AppearanceHelper.waterIcon
        default:
            return AppearanceHelper.normalIcon
        }
    }
    

    func getTypeBg(type: String) -> UIImage {
        
        switch (type) {
        case "Bug":
            return AppearanceHelper.bugBg
        case "Dark":
            return AppearanceHelper.darkBg
        case "Dragon":
            return AppearanceHelper.dragonBg
        case "Electric":
            return AppearanceHelper.electricBg
        case "Fairy":
            return AppearanceHelper.fairyBg
        case "Fighting":
            return AppearanceHelper.fightingBg
        case "Fire":
            return AppearanceHelper.fireBg
        case "Flying":
            return AppearanceHelper.flyingBg
        case "Ghost":
            return AppearanceHelper.ghostBg
        case "Grass":
            return AppearanceHelper.grassBg
        case "Ground":
            return AppearanceHelper.groundBg
        case "Ice":
            return AppearanceHelper.iceBg
        case "Normal":
            return AppearanceHelper.normalBg
        case "Poison":
            return AppearanceHelper.poisonBg
        case "Psychic":
            return AppearanceHelper.psychicBg
        case "Rock":
            return AppearanceHelper.rockBg
        case "Steel":
            return AppearanceHelper.steelBg
        case "Water":
            return AppearanceHelper.waterBg
        default:
            return AppearanceHelper.normalBg
        }
    }
    


}
