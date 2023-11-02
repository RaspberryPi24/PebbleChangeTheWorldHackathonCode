//UserSettingsPage.swift
//PureFindr.Offical
//Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class UserSettingsViewController: UIViewController {

    @IBOutlet weak var privacySwitch: UISwitch!
    @IBOutlet weak var languagePicker: UIPickerView!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var notificationSegmentedControl: UISegmentedControl

    let languages = ["English", "Spanish", "French", "German", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()

        privacySwitch.isOn = UserDefaults.standard.bool(forKey: "privacy")
        let selectedLanguageIndex = UserDefaults.standard.integer(forKey: "selectedLanguageIndex")
        languagePicker.selectRow(selectedLanguageIndex, inComponent: 0, animated: false)
        darkModeSwitch.isOn = UserDefaults.standard.bool(forKey: "darkMode")
        let notificationPreference = UserDefaults.standard.integer(forKey: "notificationPreference")
        notificationSegmentedControl.selectedSegmentIndex = notificationPreference
    }

    @IBAction func saveSettingsButtonTapped(_ sender: UIButton) {

        UserDefaults.standard.set(privacySwitch.isOn, forKey: "privacy")
        let selectedLanguageIndex = languagePicker.selectedRow(inComponent: 0)
        UserDefaults.standard.set(selectedLanguageIndex, forKey: "selectedLanguageIndex")
        UserDefaults.standard.set(darkModeSwitch.isOn, forKey: "darkMode")
        let notificationPreference = notificationSegmentedControl.selectedSegmentIndex
        UserDefaults.standard.set(notificationPreference, forKey: "notificationPreference")
    }
}

extension UserSettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
}

