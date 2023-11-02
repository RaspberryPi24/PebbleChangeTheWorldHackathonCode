//OrganizationFacilities.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

struct Facility {
    let name: String
    let location: String
    let isProBono: Bool
}

class OrganizationFacilitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var facilitiesTableView: UITableView

    //Default sample data
    let facilitiesData: [Facility] = [
        Facility(name: "Shelter A", location: "City X", isProBono: true),
        Facility(name: "Facility B", location: "City Y", isProBono: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        facilitiesTableView.dataSource = self
        facilitiesTableView.delegate = self
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return facilitiesData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FacilityCell", for: indexPath)

        let facility = facilitiesData[indexPath.row]

        cell.textLabel?.text = facility.name
        cell.detailTextLabel?.text = facility.location
        cell.accessoryType = facility.isProBono ? .checkmark : .none

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let facility = facilitiesData[indexPath.row]

        if facility.isProBono {
            showAlert(message: "Selected Pro-Bono Facility: \(facility.name)")
        } else {
            showAlert(message: "Selected Facility for Purchase: \(facility.name)")
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Facility Selection", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

