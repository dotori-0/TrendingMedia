//
//  SettingsTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/18.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    enum Settings: String {
        case general = "전체 설정"
        case personal = "개인 설정"
        case other = "기타"
        
        func settingTitles() -> [String] {
            let generalSettings = ["공지사항", "실험실", "버전 정보"]
            let personalSettings = ["개인/보안", "알림", "채팅", "멀티프로필", "집중 모드"]
            let otherSettings = ["고객센터/도움말"]
            
            switch self {
                case .general: return generalSettings
                case .personal: return personalSettings
                case .other: return otherSettings
            }
        }
    }
    
    //    let generalSettings = ["공지사항", "실험실", "버전 정보"]
    //    let personalSettings = ["개인/보안", "알림", "채팅", "멀티프로필", "집중 모드"]
    //    let otherSettings = ["고객센터/도움말"]
    
    @IBOutlet weak var concentrationModeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    // 섹션 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    // 섹션 헤더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return Settings.general.rawValue
            case 1:
                return Settings.personal.rawValue
            case 2:
                return Settings.other.rawValue
            default:
                return "오류"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return Settings.general.settingTitles().count
            case 1:
                return Settings.personal.settingTitles().count
            case 2:
                return Settings.other.settingTitles().count
            default:
                return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        cell.textLabel?.font = .systemFont(ofSize: 13)
        
        switch indexPath.section {
            case 0:
//                for i in 0..<Settings.general.settingTitles().count {
                    cell.textLabel?.text = Settings.general.settingTitles()[indexPath.row]
//                }
            case 1:
                cell.textLabel?.text = Settings.personal.settingTitles()[indexPath.row]
            case 2:
                cell.textLabel?.text = Settings.other.settingTitles()[indexPath.row]
            default:
                print("Error")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath == (0, 0) {
//            print("0, 0")
//        }
        print(indexPath)
        
        if indexPath == [1, 4] {
            print("집중 모드 클릭")
//            concentrationModeButtonClicked()  // X
//            self.concentrationModeButtonClicked(concentrationModeButton)  // X
            
            // 버튼에 액션 보내기
            concentrationModeButton.sendActions(for: .touchUpInside)
        }
    }

    

//    @IBAction func concentrationModeButtonClicked() {
    @IBAction func concentrationModeButtonClicked(_ sender: UIButton) {        
        print(#function)
    }
}
