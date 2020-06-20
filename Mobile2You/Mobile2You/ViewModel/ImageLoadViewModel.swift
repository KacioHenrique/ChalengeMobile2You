//
//  ImageLoadViewModel.swift
//  LearningTest
//
//  Created by Kacio Batista on 18/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
class ImageLoadViewModel: NSObject {
    let path:String!
    let size:Int!
    init(path:String,size:Int = 200) {
        self.path = path
        self.size = size
        super.init()
    }

    func loadImage(completionHandler:@escaping (UIImage) -> Void) {
        ApiServiceMovie.shared.fettchImage(path: self.path,size: size) { (result) in
            switch result {
                case .success(let data):
                    if let image = UIImage(data: data,scale: 1) {
                        completionHandler(image)
                    } else {
                        completionHandler(ImageEnum.dontLoadImage.getImage())
                    }
                case .failure(_):
                    completionHandler(ImageEnum.dontLoadImage.getImage())
            }
        }
    }

}
