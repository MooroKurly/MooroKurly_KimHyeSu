//
//  MyTopTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/23.
//

import UIKit

class MyTopTVC: UITableViewCell {
    
    
    public static let identifier = "MyTopTVC"
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topLabel.text = "회원 가입하고\n다양한 혜택을 받아보세요!"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
