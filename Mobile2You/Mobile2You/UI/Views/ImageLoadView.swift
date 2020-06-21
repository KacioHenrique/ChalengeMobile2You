//
//  imageLoad.swift
//  LearningTest
//
//  Created by Kacio Batista on 18/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit

class ImageLoadView: UIImageView {
    let imageViewModel:ImageLoadViewModel!
    lazy var activity:ActivityImage = {
        let activity = ActivityImage(indicatorColor: UIColor.white)
        self.addSubview(activity)
        activity.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        return activity
    }()
    init(imageViewModel:ImageLoadViewModel) {
        self.imageViewModel = imageViewModel
        super.init(frame: .zero)
        loadImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func loadImage() {
        self.activity.startAnimating()
        imageViewModel.loadImage { [weak self] (image) in
            guard let self = self else { return }
            self.alpha = 0
            UIView.animate(withDuration: 1) { [weak self] in
                self?.image = image
                self?.alpha = 1
                self?.activity.stopAnimating()
            }

        }
    }
}
