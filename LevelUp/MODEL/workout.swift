//
//  workout.swift
//  LevelUp
//
//  Created by AMAN K.A on 15/01/24.
//

import Foundation

struct ExerciseComment: Codable {
//    let count: Int
//    let next: String?
//    let previous: String?
    let results: [ExerciseCommentResult]
}

struct ExerciseCommentResult: Codable {
    let id: Int
//    let uuid: String
//    let exercise: Int
    let comment: String
}
