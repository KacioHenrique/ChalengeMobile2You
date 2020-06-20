//
//  ApiServiceMovie.swift
//  LearningTest
//
//  Created by Kacio Batista on 16/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import Alamofire
protocol ApiServiceMovieProtocol {
    func fetchMovieById(id:Int,completionHandler:@escaping (_ descripiton:Data?) -> Void)
    func fettchImage(path:String,completionHandler:@escaping (_ result:Result<Data,AFError>) -> Void)
}
final class ApiServiceMovie: BaseApiService {
    static let shared = ApiServiceMovie()
    func fetchMovieById(id:Int,completionHandler:@escaping (_ response:Result<Movie, AFError>) -> Void) {
        AF.request(EndPoint.movie(id: id).getValue(url: baseURL),method: .get,parameters: parameters).responseDecodable { (response : (DataResponse<Movie, AFError>)) in
            completionHandler(response.result)
        }
    }
    func fettchImage(path:String,size:Int,completionHandler:@escaping (_ result:Result<Data,AFError>) -> Void) {
        AF.request(EndPoint.image(size: size, path: path).getValue(url: baseURL)).responseData { (response) in
            completionHandler(response.result)
        }
    }
}

