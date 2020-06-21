//
//  MovieTableViewCell.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    lazy var imageLoadView = ImageLoadView(imageViewModel: ImageLoadViewModel(path:""))
    let vStack = FactoryUI.make.makeStackView(axis: .vertical, alignment: .leading, distribution: .equalSpacing, space: 5)
    let title = FactoryUI.make.makeRegulaFont(text: "text qualquer")
    let subTitle = FactoryUI.make.makeRegulaFont(text: "Terro",font: UIFont.systemFont(ofSize: 15, weight: .regular))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
     }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(subTitle)
        self.contentView.addSubview(imageLoadView)
        self.contentView.addSubview(vStack)
        
        imageLoadView.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        vStack.snp.makeConstraints { (make) in
            make.left.equalTo(imageLoadView.snp.right).offset(10)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    func updateData(movie:Movie) {
        title.text = movie.title
        subTitle.text = "Terro"
        imageLoadView = ImageLoadView(imageViewModel:ImageLoadViewModel(path:movie.imagePath))
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        subTitle.text = nil
        imageLoadView.image = nil
    }
}
