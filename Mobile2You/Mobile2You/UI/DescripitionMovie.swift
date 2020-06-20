//
//  DescripitionMovie.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class DescripitionMovie: UIView {
    var descripitionViewModel:DescripitionViewModel?
    lazy var stackViewH:UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    lazy var title:UILabel = {
      let textLabel = UILabel(frame: .zero)
      textLabel.backgroundColor = UIColor.black
      textLabel.text  = "Test Suite 'Selected tests' started at 2020-06-20 12:08:30.508"
      textLabel.textAlignment = .left
      textLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
      textLabel.textColor = .white
        textLabel.numberOfLines = 0
        return textLabel
    }()
    lazy var button:UIButton = {
       let button = UIButton(frame: .zero)
       button.setImage(ImageEnum.emptyHeart.getImage(), for: .normal)
       button.setImage(ImageEnum.fullHeart.getImage(), for: .selected)
       return button
    }()
    init(descripitionViewModel:DescripitionViewModel) {
        self.descripitionViewModel = descripitionViewModel
        super.init(frame: .zero)
        setupUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    fileprivate func setupUI() {
        stackViewH.addArrangedSubview(title)
        stackViewH.addArrangedSubview(button)
        stackViewH.backgroundColor = .black
        self.addSubview(stackViewH)
        stackViewH.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        button.snp.makeConstraints { (make) in
            make.width.height.equalTo(25)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
