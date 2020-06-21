//
//  ActivityImage.swift
//  LearningTest
//
//  Created by Kacio Batista on 19/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

public class ActivityImage: UIActivityIndicatorView {
    init(indicatorColor:UIColor) {
        super.init(style: .large)
        self.hidesWhenStopped = true
        self.color = indicatorColor
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
