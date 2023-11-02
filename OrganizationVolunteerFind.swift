//OrganizationVolunteerFind.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

struct Volunteer {
    let name: String
    let location: String
    let availability: String
    let skills: [String]
}

class OrganizationVolunteersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var volunteersTableView: UITableView

    //Default Sample Data
    let volunteersData: [Volunteer] = [
        Volunteer(name: "John Doe", location: "City X", availability: "Weekdays", skills: ["Skill A", "Skill B"]),
        Volunteer(name: "Jane Smith", location: "City Y", availability: "Weekends", skills: ["Skill C", "Skill D"]),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        volunteersTableView.dataSource = self
        volunteersTableView.delegate = self
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volunteersData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VolunteerCell", for: indexPath)

        let volunteer = volunteersData[indexPath.row]

        cell.textLabel?.text = volunteer.name
        cell.detailTextLabel?.text = "Location: \(volunteer.location)\nAvailability: \(volunteer.availability)\nSkills: \(volunteer.skills.joined(separator: ", "))"

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let volunteer = volunteersData[indexPath.row]
        
        showAlert(message: "Selected Volunteer: \(volunteer.name)")

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Volunteer Selection", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

