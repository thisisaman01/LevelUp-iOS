//
//  WorkoutImage.swift
//  LevelUp
//
//  Created by AMAN K.A on 15/01/24.
//

import Foundation

struct ExerciseImage: Codable {
//    let count: Int
//    let next: String?
//    let previous: String?
    let results: [ExerciseImageResult]
}

struct ExerciseImageResult: Codable {
//    let id: Int
//    let uuid: String
//    let exercise_base: Int
//    let exercise_base_uuid: String
    let image: String
//    let is_main: Bool
//    let style: String
//    let license: Int
//    let license_title: String
//    let license_object_url: String
//    let license_author: String
//    let license_author_url: String
//    let license_derivative_source_url: String
//    let author_history: [Any]
}
