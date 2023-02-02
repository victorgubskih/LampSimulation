//
//  ViewController.swift
//  LampSimilation
//
//  Created by viktor on 24.01.2023.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var switchOnIndexes: Set<Int> = [0, 1, 2, 3, 4, 5]
    var switchOffIndexes: Set<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSwitch()
    }
    
    private func updateSwitch() {
        label.text = "On: \(switchOnIndexes.sorted())\n Off: \(switchOffIndexes.sorted())"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LampCell", for: indexPath) as? LampCell
        else {fatalError()}
        
        cell.configure(index: indexPath.row)
        cell.delegate = self
        return cell
    }
}

extension ViewController: LampCellDelegate {
    func didSwitch(on: Bool, index: Int){
        if on {
            switchOnIndexes.insert(index)
            switchOffIndexes.remove(index)
        } else {
            switchOnIndexes.remove(index)
            switchOffIndexes.insert(index)
            
        }
        updateSwitch()
    
    }
}

protocol LampCellDelegate: AnyObject {
    func didSwitch(on: Bool, index:Int)
}
