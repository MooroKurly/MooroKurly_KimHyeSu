//
//  HomeTitleLabelCVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/15.
//

import UIKit

class HomeTitleLabelCVC: UICollectionViewCell {

    public static let identifier = "HomeTitleLabelCVC"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeTitleLabelCVC", bundle: nil)
    }
    
    func setData(title : String, selected : Bool){
        titleLabel.text = title
        if selected == true {
            titleLabel.textColor = .purple
        }
        else {
            titleLabel.textColor = .gray
        }
        
    }

}
