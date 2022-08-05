//
//  Data.swift
//  CalorieBuddy
//
//  Created by Khushiyant on 25/07/22.
//

import Foundation

struct GraphAPIResponse: Codable {
    let status: Int
    let result: TipResult
}
struct TipResult: Codable {
    let id: Int
    let tip: String
}
