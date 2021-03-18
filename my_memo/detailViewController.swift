//
//  detailViewController.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/18.
//

import UIKit

class detailViewController: UIViewController {
    
    private var models = [Memo]()
    var index : Int? //prepare로 앞에서 인덱스 정보만 가져옴
    
    @IBOutlet weak var ContentsLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //이거 나중에 데이터 옮기는거 해보자..

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            models = try context.fetch(Memo.fetchRequest())
        }
        catch{
            
        }
        
        if let idx = index
        {
            self.title = models[idx].name
            ContentsLabel.text = models[idx].contents
        }
        
        
        
    }


}

