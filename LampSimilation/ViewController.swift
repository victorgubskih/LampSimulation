//
//  ViewController.swift
//  LampSimilation
//
//  Created by viktor on 24.01.2023.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var switchOnCount: Int = 6
    var switchOffCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSwitch()
    }
    
    private func updateSwitch() {
        label.text = "On: \(switchOnCount)  Off: \(switchOffCount)"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LampCell", for: indexPath) as? LampCell
        else {fatalError()}
        
        cell.configure()
        cell.delegate = self
        return cell
    }
}

extension ViewController: LampCellDelegate {
    func didSwitch(on: Bool) {
        switchOnCount = on ? switchOnCount + 1 : switchOnCount - 1
        switchOffCount = on ? switchOffCount - 1 : switchOffCount + 1
        updateSwitch()
    
    }
}

protocol LampCellDelegate: AnyObject {
    func didSwitch(on: Bool)
}
