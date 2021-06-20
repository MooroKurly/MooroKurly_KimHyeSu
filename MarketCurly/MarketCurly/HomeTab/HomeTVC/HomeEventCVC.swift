//
//  HomeEventCVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/23.
//

import UIKit
import Kingfisher

class HomeEventCVC: UICollectionViewCell {

    public static let identifier = "HomeEventCVC"
    @IBOutlet weak var eventImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    static func nib() -> UINib{
       return UINib(nibName: "HomeEventCVC", bundle: nil)
   }

    func setData(imageURL: String){
        //eventImageView.image = image
        let url = URL(string: imageURL)
        eventImageView.kf.setImage(with: url)
        
    }
    
    
}
