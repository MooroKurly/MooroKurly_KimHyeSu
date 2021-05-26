//
//  TopLabelCollectionViewCell.swift
//  Curly
//
//  Created by 김혜수 on 2021/05/12.
//  Copyright © 2021 kimhyesu. All rights reserved.
//

import UIKit

class TopLabelCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "TopLabelCollectionViewCell"
    
    @IBOutlet weak var topLabel: UILabel!
    
    func setData(top: String){
        topLabel.text = top
    }
    
    
}
