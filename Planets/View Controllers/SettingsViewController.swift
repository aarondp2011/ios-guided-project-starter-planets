//
//  SettingsViewController.swift
//  Planets
//
//  Created by Aaron Peterson on 5/2/20.
//  Copyright © 2020 Lambda Inc. All rights reserved.
//

import UIKit

protocol SettingsDelegate: class {
    func didTogglePluto()
}

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var plutoSwitch: UISwitch!
    weak var delegate: SettingsDelegate?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViews()
    }
    
    @IBAction func toggledPluto(_ sender: UISwitch) {
        
        // Setting a Default
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        delegate?.didTogglePluto()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateViews() {
        // Get a Default
        let userDefaults = UserDefaults.standard
        plutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
    
}
