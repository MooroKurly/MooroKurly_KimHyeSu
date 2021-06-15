//
//  CategoryRepeatTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/07.
//

import UIKit

class CategoryRepeatTVC: UITableViewCell {

    public static let identifier = "CategoryRepeatTVC"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        // 버튼 범위 확인
        print("자주 사는 상품 버튼 클릭!")
    }
}
