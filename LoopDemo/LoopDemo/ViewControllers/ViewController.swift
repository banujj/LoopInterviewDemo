//
//  ViewController.swift
//  LoopDemo
//
//  Created by BanuchanderJ on 28/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moviesHolderView: MoviesHolderTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        moviesHolderView.parentViewController = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesHolderView.setupAndInitializeMoviesData(for: "staff_picks", shouldShowFavouriteHeader: true)
        
    }

    
    @IBAction func buttonSearchMoviesPressed(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviesSearchViewControllerSBID") as! MoviesSearchViewController
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
   

}

