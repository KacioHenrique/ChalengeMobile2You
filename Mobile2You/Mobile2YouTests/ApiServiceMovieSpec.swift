//
//  SpecBaseApiService.swift
//  Mobile2YouTests
//
//  Created by Kacio Batista on 21/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble
import UIKit
@testable import Mobile2You
class ApiServiceMovieSpec : QuickSpec {
    
    override func spec() {
        describe("Test ApiServiceMovie") {
            sepcFettchGenres()
            specFettchMovie()
            specFettchSimilaresMovie()
        }
    }
    func specFettchMovie() {
        let id = 105
        it("test Movie with id 105, Shold return Movie type reference By id") {
            waitUntil { done in
                ApiServiceMovie.shared.fetchMovieById(id: id) { (result) in
                    switch result {
                    case .success(let movie):
                        expect(movie.title).to(equal("Back to the Future"))
                    case .failure(let error):
                        expect(error.localizedDescription).notTo(equal(""))
                    }
                    done()
                }
            }
        }
    }
    func specFettchSimilaresMovie() {
        let id = 105
        it("test SimilaresMovie with id 105, shold return a array Movies") {
            waitUntil { done in
                ApiServiceMovie.shared.fettchSimilarMovies(id: id) { (result) in
                    switch result {
                    case .success(let similares):
                        expect(similares.movies.count) > 0
                        expect(similares.movies.first).to(beAKindOf(Movie.self))
                    case .failure(let error):
                        expect(error.localizedDescription).notTo(equal(""))
                    }
                    done()
                }
            }
        }
    }
    
    func sepcFettchGenres() {
        it("test FettchGenres, shold return a arry of Genres") {
            waitUntil { done in
                ApiServiceMovie.shared.fettchGenres { (result) in
                    switch result {
                    case .success(let genresMovies):
                        expect(genresMovies.genres.count) > 0
                    case .failure(let error):
                        expect(error.localizedDescription).notTo(equal(""))
                    }
                    done()
                }
            }
        }
    }
}
