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
    func buttonSelect(bool:Bool) -> UIImage {
        if bool {
            return ImageEnum.fullHeart.getImage()
        } else {
            return ImageEnum.emptyHeart.getImage()
        }
    }
}
