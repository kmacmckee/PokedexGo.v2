//
//  PokemonCollectionViewCell.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    var pokemon: Pokemon?
    var pokemonId: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    
    
}
