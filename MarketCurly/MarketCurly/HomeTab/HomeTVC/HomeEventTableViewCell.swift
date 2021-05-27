//
//  HomeEventTableViewCell.swift
//  MarketCurly
//
//  Created by 김혜수 on 2021/05/23.
//

import UIKit

class HomeEventTableViewCell: UITableViewCell, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    @IBOutlet weak var homeEventCollectionView: UICollectionView!
    
    var eventImageList : [HomeEventDataModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        
        homeEventCollectionView.delegate = self
        homeEventCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func registerXib() {

        let homeEventCVC = UINib(nibName: "HomeEventCVC", bundle: nil)
        homeEventCollectionView.register(homeEventCVC, forCellReuseIdentifier: "HomeEventCVC")

    }
    
}

extension HomeEventTableViewCell : UITableViewDelegate {
    
    
}

extension HomeEventTableViewCell : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let eventImageCell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>) else {
            <#statements#>
        }
    }
    
    
}
