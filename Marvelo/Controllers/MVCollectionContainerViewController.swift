//
//  MVCollectionContainerViewController.swift
//  Marvelo
//
//  Created by Mohamed EL Meseery on 11/27/17.
//  Copyright © 2017 Meseery. All rights reserved.
//

import UIKit

class MVCollectionContainer: MVBaseContainerViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pagerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pictureCollectionViewController = self.contentViewController as? MVPictureCollectionViewController{
            pictureCollectionViewController.delegate = self
        }
    }
}

extension MVCollectionContainer: PictureCollectionViewControllerDelegate{
    func currentPageIndex(page: Int, pagesCount: Int){
        self.pagerLabel.text = "\(page)/\(pagesCount)"
    }
    func currentPageTitle(title: String){
        self.nameLabel.text = title
    }
}
