//OrganizationSettingsPage.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class OrganizationSettingsViewController: UIViewController {

    @IBOutlet weak var publicOrUnlistedSwitch: UISwitch!
    @IBOutlet weak var accountVisibilitySegmentedControl: UISegmentedControl!
    @IBOutlet weak var blockUserButton: UIButton!

    @IBOutlet weak var languagePicker: UIPickerView!
    let languages = ["English", "Spanish", "French", "German", "Other"]

    @IBOutlet weak var lightModeSwitch: UISwitch!
    @IBOutlet weak var notificationsSwitch: UISwitch!
    @IBOutlet weak var scheduleNotificationsButton: UIButton

    override func viewDidLoad() {
        super.viewDidLoad()

        languagePicker.delegate = self
        languagePicker.dataSource = self
        languagePicker.selectRow(0, inComponent: 0, animated: false) // Default language
    }

    @IBAction func accountVisibilityChanged(_ sender: UISegmentedControl) {
        
        let selectedSegmentIndex = sender.selectedSegmentIndex
    }
}

extension OrganizationSettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedLanguage = languages[row]
    }
}

