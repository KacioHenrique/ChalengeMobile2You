//
//  MovieTableViewCellSpec.swift
//  Mobile2YouTests
//
//  Created by Kacio Batista on 21/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
import UIKit
@testable import Mobile2You
class MovieTableViewCellSpec: QuickSpec {
    let recordMode:Bool = false
    let nameSnapShot = "MovieTableViewCell"
    let cell = MovieTableViewCell(style: .default, reuseIdentifier: "cell")
    override func spec() {
         let movie = Movie(title: "Back to the Future", id: 105, imagePath: "/7lyBcpYB0Qt8gYhXYaEZUNlNQAv.jpg", likes: 13269, popularity: 30.289)
        cell.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        cell.updateData(movie: movie, genres: "terror")
        describe("spec of MovieTableViewCell") {
            it("has valid snapshot") {
               
                if self.recordMode {
                    expect(self.cell) == recordSnapshot(self.nameSnapShot)
                }
                expect(self.cell) == snapshot(self.nameSnapShot)
            }
        }
    }
}
