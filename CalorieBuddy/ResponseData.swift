//
//  Data.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 25/07/22.
//

import Foundation

struct GraphAPIResponse: Codable {
    let status: Int
    let result: TipData
}
struct TipData: Codable {
    let id: Int
    let tip: String
}
