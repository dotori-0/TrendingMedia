//
//  SettingTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/18.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var birthdayFriends = ["뽀로로", "신데렐라", "올라프", "스노기", "모구리", "고래밥"]


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // 섹션의 갯수(옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3  // Default is 1 if not implemented
    }

    // 섹션의 타이틀(헤더)(옵션)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {  // 내부 매개변수
            return "생일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
             return "섹션"
        } else {
            return "섹션"
        }
    }

    // 푸터의 타이틀(옵션)
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }


    // 1. 셀의 갯수(필수): numberOfRowsInSection
    // ex. 카톡 친구 100 명이면 셀 100 개, 3천 명이면 셀 3천 개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthdayFriends.count  // 갯수 주의
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 0
        }
//        return 3  // 한 줄 일 때는 return 생략가능한데 잘 안 함
//        100
    }

    // 2. 셀의 디자인과 데이터(필수)
    // ex. 카톡 이점팔, 프로필 사진, 상태 메시지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 셀 x 100
        // Identifier 대소문자 주의
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!

        if indexPath.section == 0 {

//            if indexPath.row == 0 {
//                cell.textLabel?.text = birthdayFriends[indexPath.row]
//            } else if indexPath.row == 1 {
//                cell.textLabel?.text = birthdayFriends[indexPath.row]
//            }
            cell.textLabel?.text = birthdayFriends[indexPath.row]
//            cell.textLabel?.text = "셀 텍스트"
            cell.textLabel?.textColor = .systemMint  // iOS 15부터 가능
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "1번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemPink
            cell.textLabel?.font = .italicSystemFont(ofSize: 25)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "1번 인덱스 섹션의 텍스트"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        }

        return cell
    }
}
