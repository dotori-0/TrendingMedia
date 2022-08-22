//
//  BucketListTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketListTableViewController: UITableViewController {
    
    static let identifier = "BucketListTableViewController"
    
    // 1.
    var textFieldPlaceholder: String?  // 혹은    // 옵셔널 스트링 타입으로 선언하더라도 오류가 뜨지 않는 이유는?
    // 프로퍼티 자체(placeholder)가 옵셔널이라면? O
    // 하지만 String Interpolation이라면? ( + -> 강제해제 해 주어야 함 )
//    var textFieldPlaceholder = ""  // 이것도 가능
    
    // 클래스는 ReferenceType -> 인스턴스 자체를 변경하지 않는 이상 한 번만 될 거다!
    // IBOutlet은 viewDidLoad 호출되기 직전에 nil이 아닌지 nil인지 알 수 있음!
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
            print("텍스트필드 didSet")
        }
    }
    
    // list 프로퍼티가 추가, 삭제 등 변경되면 테이블뷰를 항상 갱신!
//    var list = ["범죄도시2": true, "탑건": false, "토르": false] {  // 순서가 없어서 안 됨
    var list = [Todo(title: "탑건2", done: true), Todo(title: "토르", done: false)] {
        didSet {
//            tableView.reloadData()  // 섹션만 혹은 셀만 변경되는 경우에는 didSet 구문이 적합하지 않을 수 있다
            print("list가 변경됨! \(oldValue) -> \(list)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        
        // 3. 값 전달
//        userTextField.placeholder = "\(textFieldPlaceholder!)를 입력해 주세요"  // string interpolation은 옵셔널 받을 수 없음
        userTextField.placeholder = "\(textFieldPlaceholder ?? "영화")를 입력해 주세요"  // string interpolation은 옵셔널 받을 수 없음
        
        
        navigationItem.title = "버킷리스트"
//        title = "버킷리스트"  // navigationItem 생략 가능
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))  // 스타일과 타겟은 코드가 거의 달리지지 않을 것
        
        
        tableView.rowHeight = 80
        
//        list.append("마녀")
//        list.append("겨울왕국")
    }
    
    @objc  // 엔터쳐도 됨
    func closeButtonClicked() {
        self.dismiss(animated: true)
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as! BucketListTableViewCell  // as? 타입 캐스팅
        
        cell.bucketListLabel.text = list[indexPath.row].title
        cell.bucketListLabel.font = .boldSystemFont(ofSize: 18)
        
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(checkBoxButtonClicked(sender:)), for: .touchUpInside)
        
//        cell.checkBoxButton.setImage(UIImage(systemName: list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
        // 배열 인덱스를 찾아서 done을 바꿔야 된다! 그리고 테이블뷰 갱신해야 한다!
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        
        cell.checkBoxButton.setImage(UIImage(systemName: value), for: .normal)
        
        return cell
    }
    
    @objc func checkBoxButtonClicked(sender: UIButton) {  // 다른 변수명보다 IBAction처럼 sender라고 많이 쓴다
        
        print("\(sender.tag)번째 버튼 클릭!")
        
        // 배열 인덱스를 찾아서 done을 바꿔야 된다! 그리고 테이블뷰 갱신해야 한다!
        list[sender.tag].done.toggle()
//        sender.setImage(UIImage(systemName: list[sender.tag].done ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
//        list[sender.tag].done.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)  // fade를 일반적으로 많이 사용한다


        // 재사용 셀 오류 확인용 코드
//        sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)  // 데이터기반이 아니라 화면기반이다
    }

    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        // 옵셔널 바인딩
        // Case 2.
//        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
//            list.append(value)
//            tableView.reloadData()
//        } else {
//            // Alert이나 토스트 메시지 띄우기 등
//        }
//
//
//        // Case 3.
//        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count)  else {
//            // Alert이나 토스트 메시지 띄우기 등
//            return
//        }
//        list.append(value)
//        tableView.reloadData()
        
        
        // Case 1.
//        list.append(sender.text!)
        list.append(Todo(title: sender.text!, done: false))
        // 중요!
        // 데이터가 달라질 때
//        tableView.reloadData()  // 프로퍼티 옵저버로 이동
//        tableView.reloadSections(IndexSet(, with: )
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .fade)  // 보통 fade나 automatic, 크게 신경 쓰지 않음
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true  // 편집이 가능하게(swipe 등)
    }
    
    // 우측 스와이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 배열 삭제 후 테이블 뷰 갱신
            list.remove(at: indexPath.row)
//            tableView.reloadData()  // 프로퍼티 옵저버로 이동
        }
    }
    
    
    // Swipe 하면 삭제나 핀 등
    // 지금은 안할 것임
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
}
