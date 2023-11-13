//
//  HomeViewController.swift
//  Delegates
//
//  Created by DA MAC M1 157 on 2023/11/13.
//

import UIKit

class HomeViewController: UIViewController {

    // Create UISegmentedControl
    let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Male", "Female", "Other"])
        segmentedControl.selectedSegmentIndex = 0 // Default selection
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    // Create UITextField for address
    let addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your address"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    // Create Next button to navigate to NextViewController
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the UI
        view.addSubview(genderSegmentedControl)
        view.addSubview(addressTextField)
        view.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            genderSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),

            addressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressTextField.topAnchor.constraint(equalTo: genderSegmentedControl.bottomAnchor, constant: 20),
            addressTextField.widthAnchor.constraint(equalToConstant: 200),

            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20),
        ])
    }

    @objc func nextButtonTapped() {
        // Instantiate NextViewController
        let nextViewController = NextViewController()

        // Pass data to NextViewController
        nextViewController.selectedGenderIndex = genderSegmentedControl.selectedSegmentIndex
        nextViewController.address = addressTextField.text

        // Push to NextViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
