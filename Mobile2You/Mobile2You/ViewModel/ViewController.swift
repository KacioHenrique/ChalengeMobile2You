//
//  ViewController.swift
//  LearningTest
//
//  Created by Kacio Batista on 16/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ApiServiceMovie.shared.fettchMovies(id: 105) { (result) in
            switch result {
            case .success(let result):
                result.movies.forEach({print($0)})
            case .failure(let error):
                print(error)
            }
        }
    }

    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .red
        self.view = view
    }

}

