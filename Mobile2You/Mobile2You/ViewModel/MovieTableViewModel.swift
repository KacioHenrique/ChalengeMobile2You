//
//  MovieTableViewModel.swift
//  Mobile2You
//
//  Created by Kacio Batista on 21/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
protocol MoiveTableViewDelagate {
    func dataLoad() -> Void
    func error(descripitionError: String)
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
    var genresMovies:GenresMovies?
    var movie:Movie?
    var similarMovies:SimilarMovies?
    init(movie id:Int , delgate:MoiveTableViewDelagate? = nil){
        self.movieId = id
        super.init()
        fetchGenres()
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
            case .failure(let error):
                self.delgate?.error(descripitionError: error.localizedDescription)
            }
        }
        group.enter()
        ApiServiceMovie.shared.fettchMovies(id: id) { [unowned self] result in
            group.leave()
            switch result {
            case .success(let similar):
                self.similarMovies = similar
                self.delgate?.dataLoad()
            case .failure(let error):
                self.delgate?.error(descripitionError: error.localizedDescription)
            }
        }
    }
    private func fetchGenres() {
        ApiServiceMovie.shared.fettchGenre { [unowned self] result in
            switch result {
            case .success(let genresMovies):
                self.genresMovies = genresMovies
            case .failure(let error):
                self.delgate?.error(descripitionError: error.localizedDescription)
            }
        }
    }
    func formatGenres(idsGenre:[Int]?) -> String {
        guard  let idsGenre = idsGenre else {
            return ""
        }
        let genresformat = genresMovies?.genres.reduce("", { (result, genre) -> String in
            if idsGenre.contains(genre.id) {
                if result != "" {
                    return result + ", " + genre.name
                }
                return genre.name
            }
            return result
        })
        return genresformat ?? ""
    }
}
