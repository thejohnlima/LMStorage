//
//  File.swift
//  
//
//  Created by John Lima on 7/11/21.
//

@testable
import LMStorage

struct Sign: LMCodable {
  let dateRange: String?
  let currentDate: String?
  let description: String?
  let compatibility: String?
  let mood: String?
  let color: String?
  let luckyNumber: String?
  let luckyTime: String?

  enum CodingKeys: String, CodingKey {
    case description, compatibility, mood, color
    case dateRange = "date_range"
    case currentDate = "current_date"
    case luckyNumber = "lucky_number"
    case luckyTime = "lucky_time"
  }
}
