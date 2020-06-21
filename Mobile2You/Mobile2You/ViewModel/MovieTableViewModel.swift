//
//  MovieTableViewModel.swift
//  Mobile2You
//
//  Created by Kacio Batista on 21/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
protocol MoiveTableViewDelagate {
    func dataLoad() -> Void
}
class MovieTableViewModel: NSObject {
    var movieId:Int! {
        didSet {
            guard let _ = self.delgate else {
                return
            }
            fetchFavoriteMovie(id: self.movieId)
        }
    }
    var delgate:MoiveTableViewDelagate? {
        didSet {
            fetchFavoriteMovie(id: self.movieId)
        }
    }
    var movie:Movie?
    init(movie id:Int , delgate:MoiveTableViewDelagate? = nil){
        self.movieId = id
        super.init()
    
    }
    private func fetchFavoriteMovie(id:Int) {
        ApiServiceMovie.shared.fetchMovieById(id: id) { [unowned self] result in
            switch result {
            case .success(let movie):
                self.movie = movie
                self.delgate?.dataLoad()
            case .failure(_):
                // make a failure Resquest
                print("falhou")
            }
        }
    }
    
}
