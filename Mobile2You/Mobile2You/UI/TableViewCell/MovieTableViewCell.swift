//
//  MovieTableViewCell.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieCellIdentifier"
    lazy var imageLoadView = ImageLoadView(imageViewModel: ImageLoadViewModel())
    let vStack = FactoryUI.make.makeStackView(axis: .vertical, alignment: .leading, distribution: .equalSpacing, space: 5)
    let title = FactoryUI.make.makeRegulaFont(text: "text qualquer",font:  UIFont.systemFont(ofSize: 17, weight: .semibold))
    let subTitle = FactoryUI.make.makeRegulaFont(text: "Terro",font: UIFont.systemFont(ofSize: 15, weight: .regular))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: MovieTableViewCell.identifier)
        self.selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = .black
        vStack.addArrangedSubview(title)
        vStack.addArrangedSubview(subTitle)
        self.contentView.addSubview(imageLoadView)
        self.contentView.addSubview(vStack)
        
        imageLoadView.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.left.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        vStack.snp.makeConstraints { (make) in
            make.left.equalTo(imageLoadView.snp.right).offset(40)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    func updateData(movie:Movie , genres:String) {
        DispatchQueue.main.async {
            self.title.text = movie.title
            self.subTitle.text = genres
            self.imageLoadView.imageViewModel.feacthImage(path: movie.imagePath)
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        DispatchQueue.main.async {
            self.title.text = nil
            self.subTitle.text = nil
            self.imageLoadView.image = nil
        }
    }
}
