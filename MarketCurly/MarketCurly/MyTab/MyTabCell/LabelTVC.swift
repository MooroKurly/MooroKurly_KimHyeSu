//
//  LabelTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/24.
//

import UIKit

class LabelTVC: UITableViewCell {

    public static let identifier = "LabelTVC"
    
    @IBOutlet weak var myTabLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(labelName: String){
        myTabLabel.text = labelName
    }
    
}
