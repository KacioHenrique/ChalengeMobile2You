//
//  ImageEnum.swift
//  LearningTest
//
//  Created by Kacio Batista on 19/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
enum ImageEnum:String {
    case dontLoadImage = "DontLoad"
    case fullHeart = "fullHeart"
    case emptyHeart = "emptyHeart"
    case circle = "halfCircle"
    func getImage() -> UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}
