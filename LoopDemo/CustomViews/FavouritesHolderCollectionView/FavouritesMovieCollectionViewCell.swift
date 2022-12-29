//
//  FavouritesMovieCollectionViewCell.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import Foundation
import UIKit
import Reusable
import SDWebImage

final class FavouritesMovieCollectionViewCell: UICollectionViewCell,NibReusable {

    @IBOutlet var imgPoster: UIImageView!
    @IBOutlet var posterHolderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.contentView.applyPosterDesignForTableHeader(with: imgPoster)
       
    }
    
    func loadCellData(from movie:Movie){
        
        imgPoster.sd_setImage(with: URL(string: movie.posterURL), placeholderImage: UIImage(named: "placeholder.png"))
        self.contentView.applyPosterDesign(with: 14)
       
    }

    
}
