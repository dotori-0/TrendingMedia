//
//  TrendingTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/21.
//

import UIKit

class TrendingTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        // 화면 전환:
        // 1. 스토리보드 파일
        // 2. 스토보드 내에 뷰 컨트롤러
        // 3. 화면 전환
        // 영화 버튼을 클릭하면 > BucketListTableViewController Present
        
        // 1.
        let storyboard = UIStoryboard(name: "Trending", bundle: nil)  // bundle: 엑스코드 내에 있는 파일이면 nil이라고 하면 된다. nil이 아닌 경우는 라이브러리에 있는 스토리보드나 다른 모듈 등
        
        // 2.
        let vc = storyboard.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        // 값 전달
//        vc.textFieldPlaceholder = "영화"
        vc.textFieldPlaceholder = sender.currentTitle
        
        // 3.
        self.present(vc, animated: true)  // 보통 true로 함
        
    }
    
    
    
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        
        // 1.
        let storyboard = UIStoryboard(name: "Trending", bundle: nil)  // bundle: 엑스코드 내에 있는 파일이면 nil이라고 하면 된다. nil이 아닌 경우는 라이브러리에 있는 스토리보드나 다른 모듈 등
        
        // 2.
        let vc = storyboard.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        // 값 전달
//        vc.textFieldPlaceholder = "드라마"
//        vc.userTextField.placeholder = "드라마"  // 인스턴스가 만들어지기 전에 사용하기 때문에 안 됨 (스토리보드랑 연결되어 있는 아웃렛은 생명주기가 좀 다르다)
        vc.textFieldPlaceholder = sender.currentTitle
        
        // 2.5 present 시 화면 전환 방식 설정 (옵션)
        vc.modalPresentationStyle = .fullScreen
        
        // 3.
        self.present(vc, animated: true)  // 보통 true로 함  // 뷰컨트롤러를 present 했으나, Navigation Controller를 스토리보드로 구현한 경우
        
        // 네비게이션 임베드 없이 풀스크린으로 모달 띄우면 다시 돌아갈 수 없음

    }
    
    
    
    @IBAction func bookButtonClicked(_ sender: UIButton) {
        
        // 1.
        let storyboard = UIStoryboard(name: "Trending", bundle: nil)  // bundle: 엑스코드 내에 있는 파일이면 nil이라고 하면 된다. nil이 아닌 경우는 라이브러리에 있는 스토리보드나 다른 모듈 등
        
        // 2.
        let vc = storyboard.instantiateViewController(withIdentifier: BucketListTableViewController.identifier) as! BucketListTableViewController
        // 값 전달
//        vc.textFieldPlaceholder = "도서"
//        vc.textFieldPlaceholder = sender.currentTitle
        // plain button에서는 sender.currentTitle를 가져오지 못한다
        vc.textFieldPlaceholder = sender.titleLabel?.text  // 이건 된다
        
        // 2.5 vc를 navigation controller embed
        let nav = UINavigationController(rootViewController: vc)
        
        // 2.5 present 시 화면 전환 방식 설정 (옵션)
        nav.modalPresentationStyle = .fullScreen
        
        // 3.
        self.present(nav, animated: true)  // 보통 true로 함

    }
    
    
    // MARK: - Table view data source

    
}
