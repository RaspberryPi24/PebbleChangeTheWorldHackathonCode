//  SupplyFoodPage.swift
//  PureFindr.Offical
//  Created by Franco Pieri & Martin Pieri

import Foundation
import UIKit

class AnimalSupplyViewController: UIViewController {

    @IBOutlet weak var foodTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var organizationPicker: UIPickerView!
    @IBOutlet weak var deliveryDateTextField: UITextField!

    //Data
    let foodTypes = ["Dog Food", "Cat Food", "Pet Supplies"]
    var selectedFoodType: String?
    var selectedQuantity: Int = 1
    var selectedOrganization: String?
    var selectedDeliveryDate: Date?

    let shelters = ["Shelter A", "Shelter B", "Shelter C"] //array changes based on imported organization.

    override func viewDidLoad() {
        super.viewDidLoad()

        foodTypeSegmentedControl.removeAllSegments()
        for (index, foodType) in foodTypes.enumerated() {
            foodTypeSegmentedControl.insertSegment(withTitle: foodType, at: index, animated: false)
        }
        selectedFoodType = foodTypes.first

        organizationPicker.delegate = self
        organizationPicker.dataSource = self

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        deliveryDateTextField.inputView = datePicker
    }

    @IBAction func quantityStepperValueChanged(_ sender: UIStepper) {
        selectedQuantity = Int(sender.value)
        quantityLabel.text = "Quantity: \(selectedQuantity)"
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
    
        if let foodType = selectedFoodType,
           let shelter = selectedOrganization,
           let deliveryDate = selectedDeliveryDate {
           
            print("Food Type: \(foodType)")
            print("Quantity: \(selectedQuantity)")
            print("Shelter: \(shelter)")
            print("Delivery Date: \(deliveryDate)")
        } else 
        {
            //reserved back to default value
            print("Food Type: Incomplete.")
            print("Quantity: Incomplete.")
            print("Shelter: Incomplete.")
            print("Delivery Date: Incomplete.")
        }
    }

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        deliveryDateTextField.text = dateFormatter.string(from: sender.date)
        selectedDeliveryDate = sender.date
    }
}

extension AnimalSupplyViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return shelters.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return shelters[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOrganization = shelters[row]
    }
}

