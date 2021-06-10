//
//  PhotoViewController.swift
//  issue-tracker
//
//  Created by 박혜원 on 2021/06/10.
//

import UIKit

class PhotoViewController: UIViewController, ReuseIdentity {
    
    @IBOutlet weak var album: UICollectionView!
    
    private var photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem()
        
        PhotoManager.shared.requestPhotos()
        PhotoManager.shared.authorization()
        
        self.album.dataSource = photoDataSource
        
        self.album.reloadData()
    }

    private func configureNavigationItem(){
        let rightButton = UIBarButtonItem(title: "추가",
                                          style: .done,
                                          target: self,
                                          action: #selector(addPhotoToTextView))
        let leftButton = UIBarButtonItem(title: "취소",
                                          style: .done,
                                          target: self,
                                          action: #selector(dismissPhotoAlbum))
        
        self.navigationItem.rightBarButtonItem = rightButton
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc
    func addPhotoToTextView(){
        
    }
    @objc
    func dismissPhotoAlbum(){
        self.presentingViewController?.dismiss(animated: true)
    }
}
