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
        super.init(style: .grouped)
        self.movieTableViewModel.delgate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let movie = self.movieTableViewModel.movie else {
            return UIView(frame: .zero)
        }
        return MovieHeaderView(movie: movie)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height * 0.8
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movie =  movieTableViewModel.similarMovies?.movies[indexPath.row] , let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else {
            return UITableViewCell(frame: .zero)
        }
        
        cell.updateData(movie: movie, genres: self.movieTableViewModel.formatGenres(idsGenre: movie.genresId))
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTableViewModel.similarMovies?.movies.count ?? 0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MovieTableViewController: MoiveTableViewDelagate {
    func error(descripitionError: String) {
        let errorView = ErrorViewScreen(descripitionError: descripitionError)
        errorView.frame = CGRect(x:0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        self.view.addSubview(errorView)
    }
    
    func dataLoad() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
