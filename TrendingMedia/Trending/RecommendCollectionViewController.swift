//
//  RecommendCollectionViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView > CollectionView
 Row > Item
 heightForRowAt > FlowLayout (heightForItemAt이 없는 이유)
*/


class RecommendCollectionViewController: UICollectionViewController {
    
    var imageURL = "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()

        // 컬렉션뷰의 셀 크기, 셀 사이의 간격 등을 화면이 뜨기 전에 설정 (Estimate Size none으로 설정!)
        // 보통 비율로 잡는다
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2) // 셀이 가지는 크기 CGSize Core Graphic Size
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        // 보통 같게 설정함
        
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
        
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // self 생략 가능
//        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다")
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다", duration: 1, position: .center)        
    }
    
}
