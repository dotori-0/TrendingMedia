//
//  ShoppingTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

import RealmSwift


class ShoppingTableViewController: UITableViewController {
    
    let localRealm = try! Realm()

    @IBOutlet weak var textFieldContainerView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var shoppingList = ["그립톡 구매하기", "세숑이 밥 주기", "아이패드 케이스 최저가 알아보기", "양말"]
    
    var shoppingItems: Results<ShoppingItem>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldContainerView.configureViewDesign()
        textField.backgroundColor = .clear
//      textField.layer.borderColor = UIColor.black.cgColor  // X
        textField.borderStyle = .none
        textField.placeholder = "무엇을 구매하실 건가요?"
        
        addButton.configureButtonDesign()
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.label, for: .normal)
        
//        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
        // 넣으면 테이블 뷰의 사이즈는 그대로고 가로 스크롤이 생김
        
        
        // Realm
        shoppingItems = localRealm.objects(ShoppingItem.self)
    }

    // 섹션 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4

        // 텍스트필드 부분도 cell일 경우, 헤더 타이틀이 있어야만 적용됨. 헤더가 ""여도 안 됨.
        // 텍스트필드 부분이 UIView일 경우, 헤더 타이틀이 없어도 적용됨
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return ""
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return shoppingList.count
        return shoppingItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistTableViewCell", for: indexPath) as! ChecklistTableViewCell
    
        cell.configureTableViewCellDesign()
        
        let checkImageView = cell.checkImageView!
        let starButton = cell.starButton!
        
//        checkImageView.showCheckState(checked: indexPath.row == 0 ? true : false)
//        cell.label.text = shoppingList[indexPath.row]
//        starButton.showFavoriteState(isFavorite: indexPath.row == 1 ? false : true)
        
        let item = shoppingItems[indexPath.row]
        checkImageView.showCheckState(checked: item.isDone ? true : false)
        cell.label.text = item.title
        starButton.showFavoriteState(isFavorite: item.isFavorite ? true: false)
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func addToChecklist() {
        print(#function)
//        shoppingList.append(textField.text!)
        let item = ShoppingItem(item: textField.text!)  // Record
        try! localRealm.write {
            localRealm.add(item)
            print("Realm Succeeded")
            textField.text = nil
        }
        
        tableView.reloadData()
    }
    
    
    @IBAction func textFieldReturnTapped(_ sender: UITextField) {
        addToChecklist()
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        print(#function)
        addToChecklist()
    }
}
