//
//  Mobile2YouTests.swift
//  Mobile2YouTests
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

@testable import Mobile2You
import Quick
import Nimble
import Nimble_Snapshots
import UIKit

class DescripitionMovieSpec: QuickSpec {
    let recordMode:Bool = false
    override func spec() {
        let frameToTesting = CGRect(x:0, y: 0, width:UIScreen.main.bounds.width, height: 100)
        let movie = Movie(title: "Back to the Future", id: 105, imagePath: "/7lyBcpYB0Qt8gYhXYaEZUNlNQAv.jpg", likes: 13269, popularity: 30.289)
        let descripitionMovieView = DescripitionMovieView(descripitionViewModel: DescripitionViewModel(movie: movie))
        descripitionMovieView.frame = frameToTesting
        describe("DescripitionMovie View Test") {
            it("is should appear DescripitionMovie button empty heart") {
                let nameSnapShot = "DescripitionMovie"
                descripitionMovieView.button.setImage(ImageEnum.emptyHeart.getImage(), for: .normal)
                if self.recordMode {
                   expect(descripitionMovieView) == recordSnapshot(nameSnapShot)
                }
                expect(descripitionMovieView) == snapshot(nameSnapShot)

            }
            it("is should apper DescripitionMovie button fill heart") {
                descripitionMovieView.button.setImage(ImageEnum.fullHeart.getImage(), for: .normal)
                let nameSnapShot = "DescripitionMovieInButtonPressed"
                if self.recordMode {
                   expect(descripitionMovieView) == recordSnapshot(nameSnapShot)
                }
                expect(descripitionMovieView) == snapshot(nameSnapShot)
            }
        }
    }
}
