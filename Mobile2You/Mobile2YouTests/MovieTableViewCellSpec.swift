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
    let recordMode:Bool = true
    override func spec() {
        describe("spec of MovieTableViewCell") {
            it("has valid snapshot") {
               
                if self.recordMode {
                    expect(movieHeaderView) == recordSnapshot(nameSnapShot)
                }
                expect(movieHeaderView) == snapshot(nameSnapShot)
            }
        }
    }
}
