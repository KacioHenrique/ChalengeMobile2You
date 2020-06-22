//
//  imageLoad.swift
//  LearningTest
//
//  Created by Kacio Batista on 18/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit

class ImageLoadView: UIImageView , ImageLoadDelegate {
    let imageViewModel:ImageLoadViewModel!
    let effect:Bool
    lazy var activity:ActivityImage = {
        let activity = ActivityImage(indicatorColor: UIColor.white)
        self.addSubview(activity)
        activity.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        return activity
    }()
    init(imageViewModel:ImageLoadViewModel, effect:Bool = false ) {
        self.imageViewModel = imageViewModel
        self.effect = effect
        super.init(frame: .zero)
        self.imageViewModel.delegate = self
        activity.startAnimating()
        if effect {
            self.addEffectBlur()
        }
    }
    func addEffectBlur() {
       let gradient = CAGradientLayer()
       gradient.frame = self.bounds
       let view = UIView(frame: self.bounds)
        let startColor = UIColor.clear.cgColor
       let endColor = UIColor.black.cgColor
       gradient.colors = [startColor, endColor]
        view.layer.insertSublayer(gradient, at: 0)
        view.alpha = 0.8
        addSubview(view)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadImage(image: UIImage) {
        self.alpha = 0
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.image = image
            self?.alpha = 1
            self?.activity.stopAnimating()
            if self?.effect ?? false {
                self?.addEffectBlur()
            }
        }
    }
}
