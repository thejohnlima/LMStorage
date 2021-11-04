//
//  MoviesViewController.swift
//  Example
//
//  Created by John Lima on 11/2/21.
//  Copyright © 2021 thejohnlima. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

  // MARK: - Properties
  @IBOutlet private weak var tableView: UITableView!

  private let viewModel = MoviesViewModel()

  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.fetchMovies()
  }
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.movies.count
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }

  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    64
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let movie = viewModel.movies[indexPath.row]

    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = movie.title
    cell.detailTextLabel?.text = movie.year?.description

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
