//
//  CategoryExpyTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/11.
//

import UIKit

class CategoryExpyTVC: UITableViewCell {
    
    public static let identifier = "CategoryExpyTVC"

    @IBOutlet weak var expyLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "CategoryExpyTVC", bundle: nil)
    }
    
    func setData(labelName : String){
        expyLabel.text = labelName
    }
    
    
    
    
}
