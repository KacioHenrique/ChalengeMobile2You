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
    let parameters: Parameters = ["api_key": "ea38cb11756ec70544bce581c90d238d" ]
    enum EndPoint {
        case movie(id:Int)
        case image(size:Int,path:String)
        func getValue(url:String) -> String {
            switch self {
            case .movie(let id):
                return url + "/3/movie/\(id)"
            case .image(let size,let path):
                return  "https://image.tmdb.org" + "/t/p/w\(size)" + path
            }
            
        }
    }
}
