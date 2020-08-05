//
//  DescripitionViewModel.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit

class DescripitionViewModel:NSObject {
    let movie:Movie!
    private let defaults = UserDefaults.standard
    init(movie:Movie){
        self.movie = movie
        super.init()
    }
    func infoLikes() -> String {
        return "\(movie.likes) Likes"
    }
    func infoPopularity() -> String {
        return "\(movie.popularity) Popularity"
    }
    func setInUserDefauls(like:Bool) {
        defaults.set(like, forKey: "\(movie.id)")
    }
    func getImageButton() -> UIImage {
        defaults.bool(forKey: "\(movie.id)") ? ImageEnum.fullHeart.getImage() : ImageEnum.emptyHeart.getImage()
    }
}
