//
//  MovieTableViewCell.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import UIKit
import Reusable
import SDWebImage
import FloatRatingView

final class MovieTableViewCell: UITableViewCell,NibReusable {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var starRatingView: FloatRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func loadMovieCellData(with movie:Movie){
        lblYear.text = movie.releaseDate.getYearFromDateString()
        lblMovieName.text = movie.title
        posterImageView.sd_setImage(with: URL(string: movie.posterURL), placeholderImage: UIImage(named: "placeholder.png"))
        self.posterImageView.applyPosterDesign(with: 7)
        starRatingView.rating = movie.rating
    }
    
}
