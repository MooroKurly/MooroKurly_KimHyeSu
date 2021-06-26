//
//  MyBannerTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/26.
//

import UIKit

class MyBannerTVC: UITableViewCell {
    
    public static let identifier = "MyBannerTVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.textColor = .purple
        subtitleLabel.textColor = .purple
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, subtitle: String, backgroundColor: UIColor){
        titleLabel.text = title
        subtitleLabel.text = subtitle
        bgView.backgroundColor = backgroundColor
    }
    
}
