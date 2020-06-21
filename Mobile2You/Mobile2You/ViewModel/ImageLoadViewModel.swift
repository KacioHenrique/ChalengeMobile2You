//
//  ImageLoadViewModel.swift
//  LearningTest
//
//  Created by Kacio Batista on 18/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
protocol ImageLoadDelegate {
    func loadImage(image:UIImage)
}
class ImageLoadViewModel: NSObject {
    var delegate:ImageLoadDelegate?
    
    func feacthImage(path:String,size:Int = 200) {
        ApiServiceMovie.shared.fettchImage(path: path,size: size) { (result) in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data,scale: 1) {
                    self.delegate?.loadImage(image: image)
                } else {
                    self.delegate?.loadImage(image: ImageEnum.dontLoadImage.getImage())
                }
            case .failure(_):
                self.delegate?.loadImage(image: ImageEnum.dontLoadImage.getImage())
            }
        }
    }
    
}
