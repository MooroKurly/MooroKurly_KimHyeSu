//
//  HomeCustomTabVC.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/06/15.
//

import UIKit

class HomeCustomTabVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var indicatorBar: UIView!
    @IBOutlet weak var stackviewWidth: NSLayoutConstraint!
    @IBOutlet weak var indicatorBarWidth: NSLayoutConstraint!
    
    let titleList : [String] = ["컬리추천", "신상품", "베스트", "알뜰쇼핑", "금주혜택"]
    var nowPage : Int = 0
    let viewSizeWidth : CGFloat = UIScreen.main.bounds.width
    let viewSizeHeight : CGFloat = UIScreen.main.bounds.height
    let indicatorSize : CGFloat = UIScreen.main.bounds.width * (69/375)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorBarWidth.constant = viewSizeWidth * (69/375)
        stackviewWidth.constant = viewSizeWidth
        registerXib()
        scrollView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    

    func registerXib(){
        let nib = UINib(nibName: HomeTitleLabelCVC.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: HomeTitleLabelCVC.identifier)
    }
    
    
}

extension HomeCustomTabVC : UIScrollViewDelegate {
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset == CGPoint(x: 0.0, y: 0.0) {
            nowPage = 0
            UIView.animate(withDuration: 0.1){
                self.indicatorBar.frame.origin.x = self.viewSizeWidth * (15/375)
            }
        }
        else if scrollView.contentOffset == CGPoint(x: viewSizeWidth, y: 0.0){
            nowPage = 1
            
            UIView.animate(withDuration: 0.1){
                self.indicatorBar.frame.origin.x = self.viewSizeWidth*(15/375) + self.indicatorSize
            }
             
        }
        else if scrollView.contentOffset == CGPoint(x: viewSizeWidth * 2, y: 0.0){
            nowPage = 2
            UIView.animate(withDuration: 0.1){
                self.indicatorBar.frame.origin.x = self.viewSizeWidth*(15/375) + self.indicatorSize * 2
            }
        }
        else if scrollView.contentOffset == CGPoint(x: viewSizeWidth * 3, y: 0.0){
            nowPage = 3
            UIView.animate(withDuration: 0.1){
                self.indicatorBar.frame.origin.x = self.viewSizeWidth*(15/375) + self.indicatorSize * 3
            }
        }
        else if scrollView.contentOffset == CGPoint(x: viewSizeWidth * 4, y: 0.0){
            nowPage = 4
            print(nowPage)
            UIView.animate(withDuration: 0.1){
                self.indicatorBar.frame.origin.x = self.viewSizeWidth*(15/375) + self.indicatorSize * 4
            }
            
        }
        
        collectionView.reloadData()
    }
 
    
    
}

extension HomeCustomTabVC : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // 컬렉션뷰 셀이 선택되었을 때
        
        switch indexPath.row {
        case 0:
            scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
 
        case 1:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth, y: 0.0), animated: true)
 
        case 2:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth * 2, y: 0.0), animated: true)
 
        case 3:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth * 3, y:0.0), animated: true)
 
        case 4:
            scrollView.setContentOffset(CGPoint(x: viewSizeWidth * 4, y: 0.0), animated: true)
 
        default:
            break
        }
        
    }
}

extension HomeCustomTabVC : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeTitleLabelCVC.identifier, for: indexPath) as? HomeTitleLabelCVC else {
            return UICollectionViewCell()
        }
        
        if nowPage == indexPath.row {
            cell.setData(title: titleList[indexPath.row], selected: true)
            
        }
        else {
            cell.setData(title: titleList[indexPath.row], selected: false)
        }
        
    
        
        
        return cell
    }
    
    
}

extension HomeCustomTabVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        print(UIScreen.main.bounds.width)
        
        let cellWidth = UIScreen.main.bounds.width * (69/375)
        
        return CGSize(width: cellWidth , height: collectionView.bounds.height)
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: viewSizeWidth * (15/375), bottom: 0, right: viewSizeWidth * (15/375))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}
