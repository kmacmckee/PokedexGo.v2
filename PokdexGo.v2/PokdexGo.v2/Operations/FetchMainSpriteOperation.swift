//
//  FetchMainSpriteOperation.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 7/29/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

//import Foundation
//
//class FetchMainSpriteOperation: ConcurrentOperation {
//
//    private(set) var imageData: Data?
//    private var dataTask: URLSessionDataTask?
//    private let session: URLSession
//
//    var pokemonName: String
//
//    init(form: PokemonForms, session: URLSession = URLSession.shared) {
//        self.pokemonName = form.pokemonName
//        self.session = session
//        super.init()
//    }
//
//
//    override func start() {
//        super.start()
//        state = .isExecuting
//
//        let url = imageURL.usingHTTPS!
//        let task = session.dataTask(with: url) { (data, response, error) in
//            defer { self.state = .isFinished }
//            if self.isCancelled { return }
//
//            if let error = error {
//                NSLog("Error fetching image data: \(error)")
//                return
//            }
//            self.imageData = data
//
//        }
//        task.resume()
//        dataTask? = task
//    }
//
//
//    override func cancel() {
//        super.cancel()
//        dataTask?.cancel()
//    }
//
//
//}
