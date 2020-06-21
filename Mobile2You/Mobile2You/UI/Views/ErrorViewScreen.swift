//
//  ErrorViewScreen.swift
//  Mobile2You
//
//  Created by Kacio Batista on 21/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

class ErrorViewScreen: UIView {
    let descripitionError:String
    init(descripitionError:String) {
        self.descripitionError = descripitionError
        super.init(frame: .zero)
        setupUI()
    }
    private func setupUI() {
        self.backgroundColor = .black
        let labelAlertErro = FactoryUI.make.makeBoldFont(text: descripitionError, font: UIFont.systemFont(ofSize: 45, weight: .bold), textColor: .red, numberLine: 0, textAlignment: .center)
        self.addSubview(labelAlertErro)
        labelAlertErro.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
