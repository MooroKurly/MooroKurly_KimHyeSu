//
//  LoginOKTopTVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/24.
//

import UIKit

class LoginOKTopTVC: UITableViewCell {
    
    public static let identifier = "LoginOKTopTVC"
    @IBOutlet weak var gradeView: UIView!
    @IBOutlet weak var gradeAllButton: UIButton!
    @IBOutlet weak var gradeNextButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setGradeViewUI()
        buttonUI()
        // Initialization code
    }
    
    func setGradeViewUI(){
        gradeView.layer.borderWidth = 2
        gradeView.layer.borderColor = UIColor.purple.cgColor
        gradeView.layer.cornerRadius = 3
    }
    
    func buttonUI(){
        gradeAllButton.layer.cornerRadius = 20
        gradeNextButton.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
