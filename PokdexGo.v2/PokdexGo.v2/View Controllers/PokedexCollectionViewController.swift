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

    private var seguePokemon: Pokemon?
    private var seguePokemonId: String?
    
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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        pokeAPI.fetchPokemonNames { (pokemonNames, error) in
            if let error = error {
                NSLog("Error fetching pokemon names: \(error)")
                return
            }
            guard let pokemonList = pokemonNames else { return }
            self.pokemonNames = pokemonList
        }

        
        let backgroundImage = UIImage(named: "Team_instinct_loading_screen")!
        let imageView = UIImageView(image: backgroundImage)
        self.collectionView.backgroundView = imageView
        

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
        //print("\(poke): \(indexPath.row)")
        let id = indexPath.row + 1
        
        let idString = String(id)
        var idArray = idString.compactMap( { $0 })
        if idArray.count < 2 {
            idArray.insert("0", at: 0)
            idArray.insert("0", at: 0)
        } else if idArray.count < 3 {
            idArray.insert("0", at: 0)
        }
        let idString2 = String(idArray)
        cell.pokemonId = idString2
        
        
        
        
        fetchPokemon(forcell: cell, indexPath: indexPath, pokemonName: poke)
                

        let image = UIImage(named: "pokemon_icon_\(idString2)_00")
        
        if image != nil {
            cell.imageView.image = image
        } else {
            cell.imageView.image = UIImage(named: "pokeball")
        }
        
        cell.pokemonLabel.text = poke.capitalized
    
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let pokemonName = pokemonNames[indexPath.row]
        operations[pokemonName]?.cancel()
    }
    
    
    
    
    func fetchPokemon(forcell cell: PokemonCollectionViewCell, indexPath: IndexPath, pokemonName: String) {
        
        if let cachedPokemon = cache.value(key: pokemonName) {
            //print("fetchingFromCache")
            cell.pokemon = cachedPokemon
            return
        }
        
        let fetchOp = FetchPokemonDetailsOperation(pokemonName: pokemonName)
        let cacheOp = BlockOperation {
            if let data = fetchOp.pokemon {
                //print("cachingPokemon")
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        let currentCell = collectionView.cellForItem(at: indexPath) as! PokemonCollectionViewCell
        guard currentCell.pokemon != nil else {
            NSLog("Pokemon not loaded yet")
            return
        }
        
        seguePokemon = currentCell.pokemon
        seguePokemonId = currentCell.pokemonId
        fetchPokemonQueue.addOperation {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "PokemonDetailSegue", sender: self)
            }
        }
    }
    
    

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailSegue" {
            guard let detailVC = segue.destination as? PokemonDetailViewController else { return }
            detailVC.pokemon = self.seguePokemon
            detailVC.pokemonId = self.seguePokemonId

        }
        
        
        
        

     }

}
