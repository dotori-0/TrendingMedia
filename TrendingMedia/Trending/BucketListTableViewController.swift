//
//  BucketListTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    var list = ["범죄도시2", "탑건", "토르"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list.append("마녀")
        list.append("ㅁㅁㅁ")        

    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketListTableViewCell", for: indexPath) as! BucketListTableViewCell  // as? 타입 캐스팅
        
        cell.bucketListLabel.text = list[indexPath.row]
        cell.bucketListLabel.font = .boldSystemFont(ofSize: 18)
        
        return cell
    }

    @IBAction func userTextFieldReturn(_ sender: UITextField) {
        list.append(sender.text!)
        print(list)
        
        // 중요!
        // 데이터가 달라질 때
        tableView.reloadData()
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
            tableView.reloadData()
        }
    }
    
    
    // Swipe 하면 삭제나 핀 등
    // 지금은 안할 것임
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
}
