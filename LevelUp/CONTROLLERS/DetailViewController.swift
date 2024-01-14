//
//  DetailViewController.swift
//  LevelUp
//
//  Created by AMAN K.A on 15/01/24.
//





// new with notification of reminder//



import UIKit
import UserNotifications

class DetailViewController: UIViewController {

    @IBOutlet weak var mytableview: UITableView!

    var exerciseComments: [ExerciseCommentResult] = []
    var exerciseImages: [ExerciseImageResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchExerciseComments()
        fetchExerciseImages()

        // Request permission for notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
        }
    }

    // Add these properties to keep track of fetching status
    var commentsFetched = false {
        didSet {
            checkDataAndReload()
        }
    }
    var imagesFetched = false {
        didSet {
            checkDataAndReload()
        }
    }

    func fetchExerciseComments() {
        guard let url = URL(string: "https://wger.de/api/v2/exercisecomment/") else {
            return
        }

        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error)")
                return
            }

            do {
                let decoder = JSONDecoder()
                let comments = try decoder.decode(ExerciseComment.self, from: data)
                self?.exerciseComments = comments.results
                self?.commentsFetched = true
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        dataTask.resume()
    }

    func fetchExerciseImages() {
        guard let url = URL(string: "https://wger.de/api/v2/exerciseimage/") else {
            return
        }

        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error)")
                return
            }

            do {
                let decoder = JSONDecoder()
                let images = try decoder.decode(ExerciseImage.self, from: data)
                self?.exerciseImages = images.results
                self?.imagesFetched = true
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        dataTask.resume()
    }

   
    private func checkDataAndReload() {
        if commentsFetched, imagesFetched {
            DispatchQueue.main.async {
                self.mytableview.reloadData()
            }
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(exerciseComments.count, exerciseImages.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell

        if indexPath.row < exerciseComments.count {
            cell.mylabel.text = exerciseComments[indexPath.row].comment
        }

        if indexPath.row < exerciseImages.count {
            let imageURL = URL(string: exerciseImages[indexPath.row].image)
            cell.myimage.load(url: imageURL)
        }

        return cell
    }
}

extension DetailViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = exerciseComments[indexPath.row].comment
        let reminderDate = Date(timeIntervalSinceNow: 40) // Settingg the reminder time

        scheduleReminder(at: reminderDate, withComment: comment)

        
    }

    //  reminder
    func scheduleReminder(at date: Date, withComment comment: String) {
        let content = UNMutableNotificationContent()
        content.title = "Exercise Reminder"
        content.body = comment
        content.sound = UNNotificationSound.default

        let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }
}

//  load images asynchronously
extension UIImageView {
    func load(url: URL?) {
        guard let url = url else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}
















//import UIKit
//
//class DetailViewController: UIViewController {
//
//    @IBOutlet weak var mytableview: UITableView!
//
//    var exerciseComments: [ExerciseCommentResult] = []
//    var exerciseImages: [ExerciseImageResult] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        fetchExerciseComments()
//        fetchExerciseImages()
//
//    }
//
//    // Add these properties to keep track of fetching status
//    var commentsFetched = false {
//        didSet {
//            checkDataAndReload()
//        }
//    }
//    var imagesFetched = false {
//        didSet {
//            checkDataAndReload()
//        }
//    }
//
//    func fetchExerciseComments() {
//        guard let url = URL(string: "https://wger.de/api/v2/exercisecomment/") else {
//            return
//        }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url) { [weak self] (data, response, error) in
//            guard let data = data, error == nil else {
//                print("Error fetching data: \(error)")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let comments = try decoder.decode(ExerciseComment.self, from: data)
//                self?.exerciseComments = comments.results
//                self?.commentsFetched = true
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }
//
//        dataTask.resume()
//    }
//
//    func fetchExerciseImages() {
//        guard let url = URL(string: "https://wger.de/api/v2/exerciseimage/") else {
//            return
//        }
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url) { [weak self] (data, response, error) in
//            guard let data = data, error == nil else {
//                print("Error fetching data: \(error)")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                let images = try decoder.decode(ExerciseImage.self, from: data)
//                self?.exerciseImages = images.results
//                self?.imagesFetched = true
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }
//
//        dataTask.resume()
//    }
//
//    // This function checks if both comments and images are fetched, then reloads the table view
//    private func checkDataAndReload() {
//        if commentsFetched, imagesFetched {
//            DispatchQueue.main.async {
//                self.mytableview.reloadData()
//            }
//        }
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension DetailViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return max(exerciseComments.count, exerciseImages.count)
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
//
//        if indexPath.row < exerciseComments.count {
//            cell.mylabel.text = exerciseComments[indexPath.row].comment
//        }
//
//        if indexPath.row < exerciseImages.count {
//            let imageURL = URL(string: exerciseImages[indexPath.row].image)
//            cell.myimage.load(url: imageURL)
//        }
//
//        return cell
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension DetailViewController: UITableViewDelegate {
//    // Implement UITableViewDelegate methods if needed
//}
//
//// UIImageView extension to load images asynchronously
//extension UIImageView {
//    func load(url: URL?) {
//        guard let url = url else { return }
//        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else { return }
//            DispatchQueue.main.async {
//                self?.image = UIImage(data: data)
//            }
//        }.resume()
//    }
//}
//

