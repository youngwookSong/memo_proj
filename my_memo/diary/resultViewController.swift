//
//  resultViewController.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/26.
//

import UIKit

class resultViewController: UIViewController {

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    
    var index : IndexPath? //indexpath를 가져오기 위해 이케 선언
    var feel: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        feelLabel.adjustsFontSizeToFitWidth = true

        indexLabel.text = "\(index!.row)"
        feelLabel.text = "난 지금 \(feel![index!.row])"
    }
    
    @IBAction func okItem(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
