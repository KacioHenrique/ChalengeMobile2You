//
//  MovieTableViewController.swift
//  Mobile2You
//
//  Created by Kacio Batista on 20/06/20.
//  Copyright © 2020 Kacio Batista. All rights reserved.
//

import UIKit

final class MovieTableViewController: UITableViewController {
    
    let movieTableViewModel:MovieTableViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    init(movieTableViewModel:MovieTableViewModel){
        self.movieTableViewModel = movieTableViewModel
        super.init(nibName: nil, bundle: nil)
        self.movieTableViewModel.delgate = self

    }
    
  
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let movie = self.movieTableViewModel.movie else {
            return UIView(frame: .zero)
        }
        return MovieHeaderView(movie: movie)
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height * 0.6
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
extension MovieTableViewController: MoiveTableViewDelagate {
    func dataLoad() {
        self.tableView.reloadData()
    }

}
