//
//  Movie.swift
//  Example
//
//  Created by John Lima on 11/2/21.
//  Copyright © 2021 thejohnlima. All rights reserved.
//

import LMStorage

struct Movie: LMCodable {
  let title: String?
  let description: String?
  let category: String?
  let year: Int?
  let rate: String?
  let link: String?
  let image: String?
}
