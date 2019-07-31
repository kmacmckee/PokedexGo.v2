//
//  PokedexCollectionViewController.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit
import CoreImage

private let reuseIdentifier = "PokemonCell"

class PokedexCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let cache = Cache<String, Pokemon>()
    private let fetchPokemonQueue = OperationQueue()
    private var operations = [String : Operation]()
    
    
    let pokeAPI = PokedexAPI()
    
    private var pokemonNames = [String]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
//    private var pokemon = [PokemonDetails]() {
//        didSet {
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//                print(self.pokemon)
//            }
//        }
//    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        pokeAPI.fetchPokemonForms { (forms, error) in
//            if let error = error {
//                NSLog("Error fetching pokemon: \(error)")
//                return
//            }
//            guard let formArray = forms else { return }
//            self.pokemonForms = formArray
//        }
//
        pokeAPI.fetchPokemonNames { (pokemonNames, error) in
            if let error = error {
                NSLog("Error fetching pokemon names")
                return
            }
            guard let pokemonList = pokemonNames else { return }
            self.pokemonNames = pokemonList
        }

        
        let backgroundImage = UIImage(named: "Team_instinct_loading_screen")!
        let imageView = UIImageView(image: backgroundImage)
        self.collectionView.backgroundView = imageView
        
        
        
//        pokeAPI.fetchPokemon { (pokedex, error) in
//            if let error = error {
//                NSLog("Error fetching pokemon: \(error)")
//                return
//            }
//            guard let pokemon = pokedex else { return }
//            self.pokemon = pokemon
//        }

    }
    
    
    // MARK: - Layout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3.0
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    
    

    
    
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
    
        let poke = pokemonNames[indexPath.row]
        
        
        
        fetchPokemon(forcell: cell, indexPath: indexPath, pokemonName: poke)

        
        
        cell.imageView.image = UIImage(named: "pokeball")
        cell.pokemonLabel.text = poke.capitalized
    
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonName = pokemonNames[indexPath.row]
        operations[pokemonName]?.cancel()
    }
    
    
    
    
    func fetchPokemon(forcell cell: PokemonCollectionViewCell, indexPath: IndexPath, pokemonName: String) {
        
        if let cachedPokemon = cache.value(key: pokemonName) {
            cell.pokemon = cachedPokemon
            return
        }
        
        let fetchOp = FetchPokemonDetailsOperation(pokemonName: pokemonName)
        let cacheOp = BlockOperation {
            if let data = fetchOp.pokemon {
                self.cache.cache(value: data, key: pokemonName)
            }
        }
        
        
        let checkReuseOp = BlockOperation {
            if let currentIndexPath = self.collectionView.indexPath(for: cell),
                currentIndexPath != indexPath {
                return
            }
            if let data = fetchOp.pokemon {
                cell.pokemon = data
            }
        }
        
        cacheOp.addDependency(fetchOp)
        checkReuseOp.addDependency(fetchOp)
        
        fetchPokemonQueue.addOperation(fetchOp)
        fetchPokemonQueue.addOperation(cacheOp)
        OperationQueue.main.addOperation(checkReuseOp)
        
        operations[pokemonName] = fetchOp
        
        
    }
    
    func fetchPokemonSprites(pokemon: Pokemon) {
        
    }
    

    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */

}
