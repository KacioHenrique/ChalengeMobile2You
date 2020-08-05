//
//  MovieHeaderViewSpec.swift
//  Mobile2YouTests
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
import UIKit
@testable import Mobile2You
class MovieHeaderViewSpec: QuickSpec {
    let recordMode:Bool = false
    override func spec() {
        let movie = Movie(title: "Back to the Future", id: 105, imagePath: "/7lyBcpYB0Qt8gYhXYaEZUNlNQAv.jpg", likes: 13269, popularity: 30.289)
        let movieHeaderView = MovieHeaderView(movie: movie)
        movieHeaderView.frame = UIScreen.main.bounds
        describe("testing MovieHeaderView") {
            it("MovieHeaderView View Test") {
                let nameSnapShot = "MovieHeaderView"
                if self.recordMode {
                    expect(movieHeaderView) == recordSnapshot(nameSnapShot)
                }
                expect(movieHeaderView) == snapshot(nameSnapShot)
            }
        }
    }
}
