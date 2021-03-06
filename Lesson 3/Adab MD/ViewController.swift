//
//  ViewController.swift
//  Adab MD
//
//  Created by Максуд Даудов on 03.11.2019.
//  Copyright © 2019 Максуд Даудов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var habits: [Habit] = [
        Habit(title: "Call mom", regular: 1),
        Habit(title: "Read two page of quran", regular: 1),
        Habit(title: "Having a walk", regular: 7)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = segue.identifier, segue.identifier == "addNewHabit"{
            let addHabitVC = segue.destination as? AddHabitViewController
            addHabitVC?.saveCallback = { [weak self] habit in
                self?.habits.append(habit)
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let habit = habits[indexPath.row]
        cell.textLabel?.text = "\(habit.title) | \(habit.regular)"
        return cell
    }


}

