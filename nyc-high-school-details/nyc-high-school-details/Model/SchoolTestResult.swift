//
//  SchoolTestResult.swift
//  nyc-high-school-details
//
//  Created by Nikhil Lalam on 11/4/23.
//

import Foundation

typealias SchoolTestResults = [SchoolTestResult]

struct SchoolTestResult {
    let dbn:String
    let numOfSatTestTakers: Int?
    let satCriticalReadingAvgScore: Int?
    let satMathAvgScore: Int?
    let satWritingAvgScore: Int?
}

extension SchoolTestResult: Decodable{
    enum CodingKeys: CodingKey{
        case dbn, numOfSatTestTakers, satCriticalReadingAvgScore, satMathAvgScore, satWritingAvgScore
    }
    init(from decoder: Decoder) throws {
        let values =  try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decode(String.self, forKey: .dbn)
        numOfSatTestTakers = Int(try values.decode(String.self, forKey: .numOfSatTestTakers))
        satCriticalReadingAvgScore = Int(try values.decode(String.self, forKey: .satCriticalReadingAvgScore))
        satMathAvgScore = Int(try values.decode(String.self, forKey: .satMathAvgScore))
        satWritingAvgScore = Int(try values.decode(String.self, forKey: .satWritingAvgScore))
    }
}
