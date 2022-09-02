//
//  MoviesList.swift
//  MoviesList
//
//  Created by Kostiantyn Kaniuka on 01.09.2022.
//

import Foundation

struct Movies: Hashable {
    let name: String
    let releaseDate: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func ==(lhs: Movies, rhs: Movies) -> Bool {
        return lhs.name.lowercased() == rhs.name.lowercased()
    }
}

