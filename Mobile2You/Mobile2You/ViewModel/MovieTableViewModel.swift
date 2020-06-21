//
//  MovieTableViewModel.swift
//  Mobile2You
//
//  Created by Kacio Batista on 21/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
import Foundation
protocol MoiveTableViewDelagate {
    func dataLoad() -> Void
}
class MovieTableViewModel: NSObject {
    var movieId:Int! {
        didSet {
            guard let _ = self.delgate else {
                return
            }
            request(id: self.movieId)
        }
    }
    var delgate:MoiveTableViewDelagate? {
        didSet {
            if let _ = self.delgate {
                request(id: self.movieId)
            }
        }
    }
    var movie:Movie?
    var similarMovies:SimilarMovies?
    init(movie id:Int , delgate:MoiveTableViewDelagate? = nil){
        self.movieId = id
        super.init()
        
    }

}
// MARK: - Resquest Data
extension MovieTableViewModel {
    private func request(id:Int) {
        let group = DispatchGroup()
        group.enter()
        ApiServiceMovie.shared.fetchMovieById(id: id) { [unowned self] result in
            switch result {
            case .success(let movie):
                self.movie = movie
                self.delgate?.dataLoad()
            case .failure(_):
                print("erro")
            }
        }
        group.enter()
        ApiServiceMovie.shared.fettchMovies(id: id) { [unowned self] result in
            group.leave()
            switch result {
            case .success(let similar):
                self.similarMovies = similar
                self.delgate?.dataLoad()
            case .failure(_):
                print("erro")
            }
        }
       
    }
}
