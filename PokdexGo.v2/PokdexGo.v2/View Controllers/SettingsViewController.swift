//
//  SettingsViewController.swift
//  PokdexGo.v2
//
//  Created by Kobe McKee on 8/2/19.
//  Copyright © 2019 Kobe McKee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var teamSegmentedControl: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = AppearanceHelper.backgroundColor
        
        if UserDefaults.standard.bool(forKey: "teamMystic") == true {
            teamSegmentedControl.selectedSegmentIndex = 0
        } else if UserDefaults.standard.bool(forKey: "teamValor") == true {
            teamSegmentedControl.selectedSegmentIndex = 1
        } else if UserDefaults.standard.bool(forKey: "teamInstinct") == true {
            teamSegmentedControl.selectedSegmentIndex = 2
        } else {
            UserDefaults.standard.set(true, forKey: "teamMystic")
            UserDefaults.standard.set(false, forKey: "teamValor")
            UserDefaults.standard.set(false, forKey: "teamInstinct")
            teamSegmentedControl.selectedSegmentIndex = 0
        }
        
        
        
    }
    
    
    
    @IBAction func teamIndexChanged(_ sender: UISegmentedControl) {
        let userDefaults = UserDefaults.standard

        switch sender.selectedSegmentIndex {
        case 0:
            print("Mystic")
            userDefaults.set(true, forKey: "teamMystic")
            userDefaults.set(false, forKey: "teamValor")
            userDefaults.set(false, forKey: "teamInstinct")
        case 1:
            print("Valor")
            userDefaults.set(false, forKey: "teamMystic")
            userDefaults.set(true, forKey: "teamValor")
            userDefaults.set(false, forKey: "teamInstinct")
            
        case 2:
            print("Instinct")
            userDefaults.set(false, forKey: "teamMystic")
            userDefaults.set(false, forKey: "teamValor")
            userDefaults.set(true, forKey: "teamInstinct")
            
        default:
            break
        }
        
        
    }
    


     @IBAction func donePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
     }


}
