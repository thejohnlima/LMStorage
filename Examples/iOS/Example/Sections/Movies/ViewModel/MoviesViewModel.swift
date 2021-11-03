//
//  MoviesViewModel.swift
//  Example
//
//  Created by John Lima on 11/2/21.
//  Copyright © 2021 thejohnlima. All rights reserved.
//

import Foundation

class MoviesViewModel {
  var movies: [Movie] = []

  private var movieData: Data? {
    if let path = Bundle.main.path(forResource: "movies", ofType: "json"),
       let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      return data
    }
    return nil
  }

  func fetchMovies() {
    guard let data = movieData else { return }

    movies = data.toItems()
  }
}
