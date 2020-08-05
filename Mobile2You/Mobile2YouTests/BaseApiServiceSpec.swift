//
//  BaseApiServiceSpec.swift
//  Mobile2YouTests
//
//  Created by Kacio Batista on 25/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import Quick
import Nimble
import UIKit

class BaseApiServiceSpec: QuickSpec {
    var baseApi:BaseApiService!
    override func spec() {
        describe("test BaseApiServiceSpec ") {
            context("text EndPoints") {
                afterEach {
                    self.baseApi = nil
                }
                beforeEach {
                    self.baseApi = BaseApiService()
                }
                it("shold return Base URL") {
                    expect(self.baseApi.baseURL).to(equal("https://api.themoviedb.org"))
                }
                it("shold return base url image") {
                    expect(self.baseApi.baseImage).to(equal("https://image.tmdb.org"))
                }
            }
           
        }
    }
}
