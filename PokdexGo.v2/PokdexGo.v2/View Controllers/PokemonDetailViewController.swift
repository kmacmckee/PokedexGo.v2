//
//  PokemonDetailViewController.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var spriteImageView: UIImageView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var type2ImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    var pokemon: Pokemon?
    var pokemonId: String?
    var sprites: [UIImage] = []
    var typeImages: [UIImage] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let pokemon = pokemon,
            let pokemonId = pokemonId else {
                NSLog("Error occured during ViewDidLoad")
                return
                
        }
        print(pokemonId)
        getSprites(id: pokemonId)
        //getTypeImages(pokemon: pokemon)
        
    }
    
    func updateViews() {
        spriteImageView.image = sprites.first
        spriteImageView.addShadow()
        nameLabel.text = pokemon?.pokemonName
        
    }
    
    
    
    func getSprites(id: String) {
        
        if let image1 = UIImage(named: "pokemon_icon_\(id)_00") { sprites.append(image1) }
        if let image2 = UIImage(named: "pokemon_icon_\(id)_00_shiny") { sprites.append(image2) }
//        if let image3 = UIImage(named: "pokemon_icon_\(id)_01") { pokemon.sprites?.append(image3) }
//        if let image4 = UIImage(named: "pokemon_icon_\(id)_01_shiny") { pokemon.sprites?.append(image4) }
//        if let image5 = UIImage(named: "pokemon_icon_\(id)_02") { pokemon.sprites?.append(image5) }
//        if let image6 = UIImage(named: "pokemon_icon_\(id)_02_shiny") { pokemon.sprites?.append(image6) }
//        if let image7 = UIImage(named: "pokemon_icon_\(id)_03") { pokemon.sprites?.append(image7) }
//        if let image8 = UIImage(named: "pokemon_icon_\(id)_03_shiny") { pokemon.sprites?.append(image8) }
//        if let image9 = UIImage(named: "pokemon_icon_\(id)_04") { pokemon.sprites?.append(image9) }
//        if let image10 = UIImage(named: "pokemon_icon_\(id)_04_shiny") { pokemon.sprites?.append(image10) }
//        if let image11 = UIImage(named: "pokemon_icon_\(id)_05") { pokemon.sprites?.append(image11) }
//        if let image12 = UIImage(named: "pokemon_icon_\(id)_05_shiny") { pokemon.sprites?.append(image12) }
//        if let image13 = UIImage(named: "pokemon_icon_\(id)_06") { pokemon.sprites?.append(image13) }
//        if let image14 = UIImage(named: "pokemon_icon_\(id)_06_shiny") { pokemon.sprites?.append(image14) }
//        if let image15 = UIImage(named: "pokemon_icon_\(id)_07") { pokemon.sprites?.append(image15) }
//        if let image16 = UIImage(named: "pokemon_icon_\(id)_07_shiny") { pokemon.sprites?.append(image16) }
//        if let image17 = UIImage(named: "pokemon_icon_\(id)_08") { pokemon.sprites?.append(image17) }
//        if let image18 = UIImage(named: "pokemon_icon_\(id)_08_shiny") { pokemon.sprites?.append(image18) }
//        if let image19 = UIImage(named: "pokemon_icon_\(id)_09") { pokemon.sprites?.append(image19) }
//        if let image20 = UIImage(named: "pokemon_icon_\(id)_09_shiny") { pokemon.sprites?.append(image20) }
//        if let image21 = UIImage(named: "pokemon_icon_\(id)_11") { pokemon.sprites?.append(image21) }
//        if let image22 = UIImage(named: "pokemon_icon_\(id)_11_shiny") { pokemon.sprites?.append(image22) }
//        if let image23 = UIImage(named: "pokemon_icon_\(id)_12") { pokemon.sprites?.append(image23) }
//        if let image24 = UIImage(named: "pokemon_icon_\(id)_12_shiny") { pokemon.sprites?.append(image24) }
//        if let image25 = UIImage(named: "pokemon_icon_\(id)_13") { pokemon.sprites?.append(image25) }
//        if let image26 = UIImage(named: "pokemon_icon_\(id)_13_shiny") { pokemon.sprites?.append(image26) }
//        if let image27 = UIImage(named: "pokemon_icon_\(id)_14") { pokemon.sprites?.append(image27) }
//        if let image28 = UIImage(named: "pokemon_icon_\(id)_14_shiny") { pokemon.sprites?.append(image28) }
//        if let image29 = UIImage(named: "pokemon_icon_\(id)_15") { pokemon.sprites?.append(image29) }
//        if let image30 = UIImage(named: "pokemon_icon_\(id)_15_shiny") { pokemon.sprites?.append(image30) }
//        if let image31 = UIImage(named: "pokemon_icon_\(id)_16") { pokemon.sprites?.append(image31) }
//        if let image32 = UIImage(named: "pokemon_icon_\(id)_16_shiny") { pokemon.sprites?.append(image32) }
//        if let image33 = UIImage(named: "pokemon_icon_\(id)_00_61") { pokemon.sprites?.append(image33) }
//        if let image34 = UIImage(named: "pokemon_icon_\(id)_00_61_shiny") { pokemon.sprites?.append(image34) }
//        if let image35 = UIImage(named: "pokemon_icon_\(id)_00_61_01_shiny") { pokemon.sprites?.append(image35) }
        
        updateViews()
    }
    
    
    
    



}
