//
//  FirstImageCollectionViewCell.swift
//  Curly
//
//  Created by 김혜수 on 2021/05/14.
//  Copyright © 2021 kimhyesu. All rights reserved.
//

import UIKit

class FirstImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "FirstImageCollectionViewCell"
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    func setImageData(imageName : String) {
        if let image = UIImage(named: imageName) {
            eventImageView.image = image
        }
    }
    
    
}
