//
//  PostersViewController.swift
//  Flixster
//
//  Created by Leonardo Villalobos on 2/23/23.
//

import UIKit

class PostersViewController: UIViewController {
    @IBOutlet weak var postersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postersCollectionView.dataSource = self
        self.updateCollectionViewLayout()
    }
    
    // MARK: Private helpers
    private func updateCollectionViewLayout() {
        let layout = postersCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        let width = (
            postersCollectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)
        ) / numberOfColumns
        layout.itemSize = CGSize(width: width, height: width)
    }
}

extension PostersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Implement
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Implement
        return .init()
    }
}
