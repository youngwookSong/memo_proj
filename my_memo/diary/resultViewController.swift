//
//  resultViewController.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/26.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet weak var indexLabel: UILabel!
    var index : IndexPath? //indexpath를 가져오기 위해 이케 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        indexLabel.text = "\(index![1])"
    }


}
