//import Foundation
//
//// Data model for ExerciseComment
//struct ExerciseComment: Decodable {
//    let id: Int
//    let uuid: String
//    let exercise: Int
//    let comment: String
//}
//
//// Data model for ExerciseCommentList
//struct ExerciseCommentList: Decodable {
//    let count: Int
//    let nextUrl: URL?
//    let previousUrl: URL?
//    let results: [ExerciseComment]
//}
//
//// Function to fetch ExerciseCommentList from the API
//func fetchExerciseComments(completion: @escaping (ExerciseCommentList?) -> Void) {
//    guard let apiUrl = URL(string: "https://wger.de/api/v2/exercisecomment/") else {
//        completion(nil)
//        return
//    }
//    
//    let session = URLSession.shared
//    let task = session.dataTask(with: apiUrl) { (data, response, error) in
//        guard let data = data, error == nil else {
//            completion(nil)
//            return
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let exerciseCommentList = try decoder.decode(ExerciseCommentList.self, from: data)
//            completion(exerciseCommentList)
//        } catch {
//            print("Error decoding JSON: \(error)")
//            completion(nil)
//        }
//    }
//    
//    task.resume()
//}
//
// ------ VIEW CONTROLLLER CODE///
//
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        // Call the function to fetch and display exercise comments
//        fetchAndDisplayExerciseComments()
//    }
//
//    func fetchAndDisplayExerciseComments() {
//        // Your fetchExerciseComments function and its usage
//        fetchExerciseComments { (exerciseCommentList) in
//            if let exerciseCommentList = exerciseCommentList {
//                // Do something with the exerciseCommentList
//                print("Count: \(exerciseCommentList.count)")
//
//                // Use optional binding to safely unwrap the optional URL
//                if let nextUrl = exerciseCommentList.nextUrl {
//                    print("Next URL: \(nextUrl.absoluteString)")
//                } else {
//                    print("Next URL: nil")
//                }
//
//                if let previousUrl = exerciseCommentList.previousUrl {
//                    print("Previous URL: \(previousUrl.absoluteString)")
//                } else {
//                    print("Previous URL: nil")
//                }
//
//                print("Results:")
//                for result in exerciseCommentList.results {
//                    print("  Exercise Comment:")
//                    print("    ID: \(result.id)")
//                    print("    UUID: \(result.uuid)")
//                    print("    Exercise: \(result.exercise)")
//                    print("    Comment: \(result.comment)")
//                }
//            } else {
//                print("Failed to fetch exercise comments.")
//            }
//        }
//    }
//}
//
