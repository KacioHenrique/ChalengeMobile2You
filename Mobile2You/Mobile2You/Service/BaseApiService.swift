//
//  BaseApiService.swift
//  LearningTest
//
//  Created by Kacio Batista on 19/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import Alamofire

class BaseApiService {
    let baseURL = "https://api.themoviedb.org"
    let baseImage = "https://image.tmdb.org"
    let parameters: Parameters = ["api_key": "ea38cb11756ec70544bce581c90d238d" ]
    enum EndPoint {
        case movie(id:Int)
        case similar(id:Int)
        case image(size:Int,path:String)
        func getValue(url:String) -> String {
            switch self {
            case .movie(let id):
                return url + "/3/movie/\(id)"
            case .similar(let id):
                return url + "/3/movie/\(id)/similar"
            case .image(let size,let path):
                return url + "/t/p/w\(size)" + path
            }
            
        }
    }
}
