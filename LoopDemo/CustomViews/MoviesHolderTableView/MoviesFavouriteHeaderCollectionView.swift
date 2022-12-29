//
//  MoviesFavouriteHeaderCollectionView.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import UIKit
import Reusable


final class MoviesFavouriteHeaderCollectionView: UITableViewHeaderFooterView,NibReusable {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var lblHeaderTitle: UILabel!
    
    @IBOutlet weak var favouritesHolderCollectionView: FavouritesHolderCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblHeaderTitle.backgroundColor = .white
        lblHeaderTitle.textColor = UIColor(red: 0.078, green: 0.11, blue: 0.145, alpha: 1)
        lblHeaderTitle.font = UIFont(name: "SFPro-Regular", size: 12)


    }
    
    
    func loadHeaderData(with headerTitle:NSAttributedString, shouldNeedFavouriteCollection:Bool, parentController:UIViewController?){
        lblHeaderTitle.attributedText = headerTitle
        if shouldNeedFavouriteCollection{
            favouritesHolderCollectionView.initializeSetupFavouritessHolderView(parentController: parentController)
        }else{
            favouritesHolderCollectionView.isHidden = true
        }
        
        
        print("Test HEader")
    }

}
