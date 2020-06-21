//
//  DescripitionMovieView.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class DescripitionMovieView: UIView {
    var descripitionViewModel:DescripitionViewModel!
    lazy var title = FactoryUI.make.makeBoldFont(text: self.descripitionViewModel.movie.title)
    let button = FactoryUI.make.makeButton(image: ImageEnum.emptyHeart.getImage(), selectImage: ImageEnum.fullHeart.getImage())
    init(descripitionViewModel:DescripitionViewModel) {
        self.descripitionViewModel = descripitionViewModel
        super.init(frame: .zero)
        setupUI()
        button.addTarget(self, action:#selector(actionButton) , for: .touchUpInside)
       
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @objc func actionButton() {
        button.isSelected = !button.isSelected
        button.setImage(descripitionViewModel.buttonSelect(bool: button.isSelected), for: .normal)
    }
    fileprivate func infoViewInline(image:UIImage, text:String) -> UIView {
        let image = UIImageView(image:image)
        let label = FactoryUI.make.makeRegulaFont(text:text)
        let view = UIView(frame: .zero)
        view.addSubview(image)
        view.addSubview(label)
        view.backgroundColor = .blue
        image.snp.makeConstraints { (make) in
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
            make.leadingMargin.equalToSuperview()
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(image.snp_rightMargin).offset(15)
            make.centerY.equalToSuperview()
        }
        return view
    }
    private func titleMovieSection() -> UIStackView {
        let stackView = FactoryUI.make.makeStackView()
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(25)
        }
        return stackView
    }
    private func movieRateSection() -> UIStackView {
        let stackView = FactoryUI.make.makeStackView(axis: .horizontal ,alignment: .leading ,distribution: .fillEqually,space: 0)
        stackView.addArrangedSubview(infoViewInline(image: ImageEnum.fullHeart.getImage(), text: descripitionViewModel.infoLikes()))
        stackView.addArrangedSubview(infoViewInline(image: ImageEnum.circle.getImage(), text: descripitionViewModel.infoPopularity()))
        return stackView
    }
    fileprivate func setupUI() {
        self.backgroundColor = .black
        let titleSection = titleMovieSection()
        let movieRatesSection = movieRateSection()
        self.addSubview(titleSection)
        self.addSubview(movieRatesSection)
        titleSection.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().inset(5)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        movieRatesSection.snp.makeConstraints { (make) in
            make.top.equalTo(titleSection.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(50)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
