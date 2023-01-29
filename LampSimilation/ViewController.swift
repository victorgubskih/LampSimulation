//
//  ViewController.swift
//  LampSimilation
//
//  Created by viktor on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var label: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
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
    
    }
    
    
}

protocol LampCellDelegate: AnyObject {
    func didSwitch(on: Bool)
}
