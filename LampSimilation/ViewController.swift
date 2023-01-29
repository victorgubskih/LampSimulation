//
//  ViewController.swift
//  LampSimilation
//
//  Created by viktor on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {
    var delegate: LampCellDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LampCell", for: indexPath) as? LampCell
        else {fatalError()}
        
        cell.configure()
        delegate
        return cell
    }
    
   
    
}

extension ViewController: UITableViewDelegate {
    
}

protocol LampCellDelegate {
    
   
    func didSwitch(on: Bool)
}
