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
    lazy var imageLoad = ImageLoadView(imageViewModel: ImageLoadViewModel() , effect: true)

    init(movie:Movie) {
        super.init(frame: .zero)
        setupUI(movie: movie)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(movie:Movie) {
        imageLoad.imageViewModel.feacthImage(path: movie.imagePath, size: 500)
        let descripitionMovie = DescripitionMovieView(descripitionViewModel: DescripitionViewModel(movie: movie))
        self.addSubview(imageLoad)
        self.addSubview(descripitionMovie)
        
        imageLoad.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
        
        descripitionMovie.snp.makeConstraints { (make) in
            make.top.equalTo(imageLoad.snp.bottom).inset(80)
            make.height.equalTo(80)
            make.left.right.bottom.equalToSuperview()
        }
        
        self.backgroundColor = .black
    }
}
