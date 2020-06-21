//
//  Moviesgenres.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation

struct Genre : Codable {
    let id:Int
    let name:String
}
struct GenresMovies : Codable {
    let genres:Genres
}
typealias Genres = [Genre]
