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
    
    @IBAction func remove(_ sender: Any) {
        if let idx = index
        {
            //deleteItem(item: models[idx])
            let sheet = UIAlertController(title: "삭제", message: "정말로 삭제 하시겠습니까?", preferredStyle: .actionSheet)
            sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in self.deleteItem(item: self.models[idx])
                
                self.navigationController?.popViewController(animated: true) //모달이 아니면 dismiss말고 pop해주기!!
            })) //클래스 안 함수안에서 밖에 변수 쓰려면 self써야됨
            
            present(sheet, animated: true)
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //이거 나중에 데이터 옮기는거 해보자..
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //getallitem
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
    
    func deleteItem(item: Memo)
    {
        //delete
        context.delete(item)
        
        //삭제한 후에도 저장을 해야됨5
        do{
            try context.save()
        }
        catch{
            
        }
    }


}

