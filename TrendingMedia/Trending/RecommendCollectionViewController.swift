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
    
    // 1. 값 전달 - 데이터를 받을 공간(프로퍼티) 생성
//    var movieTitle: String?  // 값을 못 받을 수도 있기 때문에, 그리고 이렇게 하면 init 작성 불 필요
//    var movieData: Movie?  // 수업 구조체
    // 따로 따로 프로퍼티 생성하지 않고 하나의 구조체 전체를 전달 받는 이유
    
    var movieData: Film?  // 커스텀 구조체
    
    var imageURL = "https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // ➕ 모두 같음
//        let movieTitle = "영화 제목"
//        
//        title = movieTitle == nil ? "데이터 없음" : movieTitle
//        title = movieTitle != nil ? movieTitle : "데이터 없음"
//        title = movieTitle ?? "데이터 없음"
        
        
        
        // 3. 값 전달 - 프로퍼티 값을 뷰에 표현
//        title = movieTitle == nil ? "데이터 없음" : movieTitle! // 네비게이션 타이틀
        title = movieData?.title
//        title = "?!?"

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
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
        
        // 옵셔널 바인딩
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()  // 빈 인스턴스 반환
        }
        
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // self 생략 가능
//        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다")
//        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다", duration: 1, position: .center)
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다", duration: 1, position: .center, completion: { action in
            self.navigationController?.popViewController(animated: true)}
        )
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다", duration: 1, position: .center) { action in
            self.navigationController?.popViewController(animated: true)
        }
        
        
//        sleep(1)  // 여기 넣으면 안 됨
//        self.navigationController?.popViewController(animated: true)
    }
    
}
