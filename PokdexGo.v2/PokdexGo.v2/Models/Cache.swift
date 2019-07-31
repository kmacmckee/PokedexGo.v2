//
//  Cache.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/31/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    
    private var cache: [Key : Value] = [:]
    private let queue = DispatchQueue(label: "PokedexCacheQueue")
    
    func cache(value: Value, key: Key) {
        queue.async {
            self.cache[key] = value
        }
    }
    
    func value(key: Key) -> Value? {
        return queue.sync { cache[key] }
    }
    
    
}
