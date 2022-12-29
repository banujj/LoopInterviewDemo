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
        
        if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let response:Array<Movie> = try decoder.decode(Array<Movie>.self, from: data)
                print(response)
                
            }
            catch {
                print(error)
            }
            
        }
        moviesHolderView.parentViewController = self
        moviesHolderView.setupAndInitializeMoviesData(for: true)
    }

    
    @IBAction func buttonSearchMoviesPressed(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MoviesSearchViewControllerSBID") as! MoviesSearchViewController
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
   

}

