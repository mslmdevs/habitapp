//
//  AddHabitViewController.swift
//  Adab MD
//
//  Created by Максуд Даудов on 10.11.2019.
//  Copyright © 2019 Максуд Даудов. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {

    var saveCallback: ((Habit)->Void)?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var regularitySlider: UISlider!
    @IBOutlet weak var regularityLabel: UILabel!
    
    @IBAction func cancelTapped(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func regularityChanged(_ sender: Any) {
        
        let regularity = Int(regularitySlider.value)
        
        regularityLabel.text = "Regularity: \(regularity)"
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, !title.isEmpty else {
            return
        }
        
        let regularity = Int(regularitySlider.value)
        
        let habit = Habit(title: title, regular: regularity, lastDone: nil)
        saveCallback?(habit)
        navigationController?.popViewController(animated: true)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.becomeFirstResponder()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
