//  UserVolunteerPage.swift
//  PureFindr.Offical
//  Created by Franco & Martin Pieri

import Foundation
import UIKit

class VolunteerPageViewController: UIViewController {
   
    @IBOutlet weak var organizationPicker: UIPickerView!
    @IBOutlet weak var volunteerDateTextField: UITextField!
    @IBOutlet weak var taskSegmentedControl: UISegmentedControl
    @IBOutlet weak var personalAcclamationsTextView: UITextView

    //Data
    var selectedOrganization: String?
    var selectedVolunteerDate: Date?
    var selectedTask: String?
    var personalAcclamations: String?


    let organizations = ["Organization A", "Organization B", "Organization C"] //array changes based on imported organization.

    let tasks = ["Supply", "Deep-Cleaning", "Marketing"]

    override func viewDidLoad() {
        super.viewDidLoad()

        organizationPicker.delegate = self
        organizationPicker.dataSource = self

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        volunteerDateTextField.inputView = datePicker

        for (index, task) in tasks.enumerated() {
            taskSegmentedControl.insertSegment(withTitle: task, at: index, animated: false)
        }
        selectedTask = tasks.first
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
        if let organization = selectedOrganization,
           let volunteerDate = selectedVolunteerDate,
           let task = selectedTask {

            let acclamations = personalAcclamations ?? "No acclamations provided"
            print("Organization: \(organization)")
            print("Volunteer Date: \(volunteerDate)")
            print("Task: \(task)")
            print("Acclamations: \(acclamations)")
        } else 
        {
            //reserved back to default value
            print("Organization: Incomplete.")
            print("Volunteer Date: Incomplete.")
            print("Task: Incomplete.")
            print("Acclamations: Incomplete.")
        }
    }

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        selectedVolunteerDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        volunteerDateTextField.text = dateFormatter.string(from: selectedVolunteerDate!)
    }
}

extension VolunteerPageViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return organizations.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return organizations[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOrganization = organizations[row]
    }
}

