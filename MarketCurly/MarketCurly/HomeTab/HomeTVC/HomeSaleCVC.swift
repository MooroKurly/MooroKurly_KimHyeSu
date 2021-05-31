//
//  HomeSaleCVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/31.
//

import UIKit

class HomeSaleCVC: UICollectionViewCell {

    
    public static let identifier = "HomeSaleCVC"
    
    @IBOutlet weak var dailySaleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var salePercentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeSaleCVC", bundle: nil)
    }
    
    func setData(image: UIImage, title: String, salePercent: String, price: String, time: String){
        dailySaleImageView.image = image
        titleLabel.text = title
        salePercentLabel.text = salePercent
        priceLabel.text = price
        timeLabel.text = time
    }

}
