//
//  MovieHeaderView.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
class MovieHeaderView: UIView {
    
    init(movie:Movie) {
        super.init(frame: .zero)
        setupUI(movie: movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(movie:Movie) {
        let imageLoad = ImageLoadView(imageViewModel: ImageLoadViewModel() , effect: true)
        imageLoad.imageViewModel.feacthImage(path: movie.imagePath, size: 500)
        let descripitionMovie = DescripitionMovieView(descripitionViewModel: DescripitionViewModel(movie: movie))
        self.addSubview(imageLoad)
        self.addSubview(descripitionMovie)
        imageLoad.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.8)
        }
        descripitionMovie.snp.makeConstraints { (make) in
            make.top.equalTo(imageLoad.snp.bottom)
            make.height.equalTo(80)
            make.left.right.bottom.equalToSuperview()
        }
        self.backgroundColor = .black
    }
}
