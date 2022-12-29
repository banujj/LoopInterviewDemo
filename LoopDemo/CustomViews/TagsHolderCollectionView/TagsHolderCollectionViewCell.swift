//
//  TagsHolderCollectionViewCell.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import Foundation
import UIKit
import Reusable
import SDWebImage

final class TagsHolderCollectionViewCell: UICollectionViewCell,NibReusable {

    @IBOutlet var lblTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.contentView.applyPosterDesignForTableHeader(with: imgPoster)
       
    }
    
    func loadCellData(from tagName:String){
        lblTag.text = tagName
        self.applyKeyFactsViewHolderDesign(with: 14)
       
    }

    
}
