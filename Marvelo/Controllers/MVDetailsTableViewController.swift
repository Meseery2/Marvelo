//
//  MVDetailsTableViewController.swift
//  Marvelo
//
//  Created by Mohamed EL Meseery on 11/27/17.
//  Copyright © 2017 Meseery. All rights reserved.
//

import UIKit

class MVDetailsTableViewController: UITableViewController {
    
    var character: MVCharacter?
    
    @IBOutlet weak var headerImageView: UIImageView!
        {
        didSet {
            if self.character != nil{
                
                if let image = MVRequest.getCharacterThumbnail(character: self.character!, completionHandler: { (image) in
                    
                    DispatchQueue.main.async {
                        self.headerImageView.image = image
                    }
                    
                    
                }){
                    
                    self.headerImageView.image = image
                }
                
                // st up back button
                let backButton = UIButton(frame: CGRect.init(x:0,
                                                             y:20,
                                                             width:30,
                                                             height:30))
                backButton.setBackgroundImage(UIImage(named: "ImageBack"), for: UIControlState.normal)
                backButton.addTarget(self, action: #selector(handleBackButton(recognizer:)), for: .touchUpInside)
    
                self.headerImageView.addSubview(backButton)
                self.headerImageView.isUserInteractionEnabled = true
                
            }
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!{
        didSet {
            if self.character != nil{
                nameLabel.text = self.character!.name
            }
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!{
        didSet {
            if self.character != nil{
                descriptionLabel.text = self.character!.desc
            }
        }
    }
    
    @IBOutlet weak var comicsContainer: UIView!{
        didSet {
            if self.character != nil{
                let vc = UIStoryboard.pictureCollectionViewController(character: self.character!)
                
                self.addChildViewController(vc)
                
                vc.view.frame = CGRect.init(x:0,y:0, width:comicsContainer.frame.size.width, height:comicsContainer.frame.size.height)
                comicsContainer.addSubview(vc.view)
                vc.didMove(toParentViewController: self)
                vc.collectionView!.delegate = self
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let panGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleBackSwipe(recognizer:)))
        panGestureRecognizer.edges = UIRectEdge.left
        tableView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @IBAction func handleBackButton(recognizer: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func handleBackSwipe(recognizer: UIScreenEdgePanGestureRecognizer) {
        
        let gestureIsDraggingFromLeftToRight = (recognizer.velocity(in: view).x > 0)
        
        switch(recognizer.state) {
        case .began:
            if(gestureIsDraggingFromLeftToRight){
                self.navigationController?.popViewController(animated: true)
            }
            break
        default:
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        if let header: UITableViewHeaderFooterView = view as? UITableViewHeaderFooterView{
            header.textLabel?.textColor = UIColor.red
        }
    }
}

extension MVDetailsTableViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: comicsContainer.frame.size.width/4, height: comicsContainer.frame.size.height-20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.present(UIStoryboard.collectionContainer(character: self.character!), animated: true, completion: nil)
    }
}
