//
//  ViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!

    @IBOutlet var dateLabelCollection: [UILabel]!

    @IBOutlet weak var mintViewLeadingConstant: NSLayoutConstraint!



    // 변수의 스코프
    let formatter = DateFormatter()

    // Class 내부에서 사용하지 못하는 이유
    // 어떤 시점에 변경해 줄지 모르기 때문에
    // 언제 실행될지 모르기 때문이다
//    formatter.dateFormat = "yyyy/MM/dd"
//    dateLabel.text = "첫번째 텍스트"


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


        formatter.dateFormat = "yyyy/MM/dd"

        mintViewLeadingConstant.constant = 120
    }

    func configureLabelDesign() {

        // 1. OutletCollection
        // 오로지 디자인만 할 때는 컬렉션으로 해도 O
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }

        // 인덱스로 접근하면 나중에 뭐가 뭔지 알 수 없음
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번째 텍스트"


        // 2. UILabel Array
        let labelArray = [dateLabel, date2Label]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }

        // 텍스트나 사용자 입력 처리는 배열 별도 처리가 좋다
        dateLabel.text = "첫번째 텍스트"
        date2Label.text = "두번째 텍스트"
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {



        dateLabel.text = formatter.string(from: sender.date)
    }

}

