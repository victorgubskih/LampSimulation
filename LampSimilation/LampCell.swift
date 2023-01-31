//
//  Lampsell.swift
//  LampSimilation
//
//  Created by viktor on 28.01.2023.
//

import UIKit

class LampCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var switchView: UISwitch!
    weak var delegate: LampCellDelegate?


    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        switchView.addTarget(self, action: #selector(didSwitch), for: .valueChanged)
    }
    func configure() {
      
    }
    @objc func didSwitch() {
        self.delegate?.didSwitch(on: self.switchView.isOn)
    }
}



