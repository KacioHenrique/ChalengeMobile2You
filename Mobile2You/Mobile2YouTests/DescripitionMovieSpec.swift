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
    override func spec() {
        describe("DescripitionMovie View Test") {
            it("is should apper DescripitionMovie button empty heart") {
                let view = DescripitionMovie(frame: CGRect(x:0, y: 0, width: UIScreen.main.bounds.width, height: 100))
                expect(view) == recordSnapshot()
            }
            it("is should apper DescripitionMovie button fill heart") {
                let view = DescripitionMovie(frame: CGRect(x:0, y: 0, width: UIScreen.main.bounds.width, height: 100))
                view.button.setImage(ImageEnum.fullHeart.getImage(), for: .normal)
                expect(view) == recordSnapshot()
            }
        }
    }
}
