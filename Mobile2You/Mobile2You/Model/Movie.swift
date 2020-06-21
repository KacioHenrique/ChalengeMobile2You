//
//  Movie.swift
//  LearningTest
//
//  Created by Kacio Batista on 18/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation

struct Movie : Codable {
    let title:String
    let id:Int
    let imagePath:String
    let likes:Int
    let popularity:Double
    var genres:Genres? = nil
    var genresId:[Int]? = []
    enum CodingKeys: String, CodingKey {
        case imagePath = "poster_path"
        case title = "title"
        case id = "id"
        case likes = "vote_count"
        case genresId = "genre_ids"
        case popularity
        case genres
    }
}
struct SimilarMovies : Codable {
    let movies:[Movie]
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

