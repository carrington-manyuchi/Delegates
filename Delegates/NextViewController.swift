//
//  NextViewController.swift
//  Delegates
//
//  Created by DA MAC M1 157 on 2023/11/13.
//

import UIKit

class NextViewController: UIViewController {

    // Properties to receive data
    var selectedGenderIndex: Int?
    var address: String?

    // UILabels to display received data
    let genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the UI
        view.backgroundColor = .white

        view.addSubview(genderLabel)
        view.addSubview(addressLabel)

        NSLayoutConstraint.activate([
            genderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),

            addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
        ])

        // Display received data
        if let genderIndex = selectedGenderIndex {
            genderLabel.text = "Selected Gender: \(genderString(for: genderIndex))"
        }

        if let addressText = address {
            addressLabel.text = "Address: \(addressText)"
        }
    }

    // Helper method to convert gender index to string
    func genderString(for index: Int) -> String {
        switch index {
        case 0:
            return "Male"
        case 1:
            return "Female"
        case 2:
            return "Other"
        default:
            return "Unknown"
        }
    }
}
