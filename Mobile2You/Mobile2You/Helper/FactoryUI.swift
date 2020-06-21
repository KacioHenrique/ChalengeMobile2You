//
//  FactoryUI.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import Foundation
import UIKit

class FactoryUI:NSObject {
    static let make = FactoryUI()
    func makeStackView(axis:NSLayoutConstraint.Axis = .horizontal, alignment:UIStackView.Alignment = .leading , distribution:UIStackView.Distribution = .fillProportionally,space:CGFloat = 8.0) -> UIStackView {
        return {
            let stackView = UIStackView(frame: .zero)
            stackView.axis = axis
            stackView.distribution = distribution
            stackView.alignment = alignment
            stackView.spacing = space
            return stackView
            }()
    }
    func makeBoldFont(text:String,font:UIFont = UIFont.systemFont(ofSize: 22, weight: .bold),textColor:UIColor = .white , numberLine:Int = 0, textAlignment:NSTextAlignment = .left) -> UILabel {
        return {
            let textLabel = UILabel(frame: .zero)
            textLabel.text  = text
            textLabel.textAlignment = textAlignment
            textLabel.font = font
            textLabel.textColor = textColor
            textLabel.numberOfLines = 0
            return textLabel
            }()
    }
    func makeRegulaFont(text:String,font:UIFont = UIFont.systemFont(ofSize: 17, weight: .regular),textColor:UIColor = .white , numberLine:Int = 0, textAlignment:NSTextAlignment = .left) -> UILabel {
        return {
            let textLabel = UILabel(frame: .zero)
            textLabel.text  = text
            textLabel.textAlignment = textAlignment
            textLabel.font = font
            textLabel.textColor = textColor
            textLabel.numberOfLines = 0
            return textLabel
            }()
    }
    func makeButton(image:UIImage) -> UIButton {
        return {
            let button = UIButton(frame: .zero)
            button.setImage(image, for: .normal)
            return button
            }()
    }
}
