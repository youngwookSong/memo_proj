//
//  NewViewController.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/17.
//

import UIKit

class NewViewController: UIViewController {
    
    @IBOutlet weak var Titletext: UITextField!
    @IBOutlet weak var Contentstext: UITextView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //모달로 구현
    @IBAction func cancelmemo(_ sender: Any) {
        print("취소")
        //alert로 취소하면 저장내용 없어진다고 구현
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savememo(_ sender: Any) {
        print("저장 완료!")
        if let title = Titletext.text
        {
            self.createItem(name: title, content: Contentstext.text)
            self.dismiss(animated: true, completion: nil) //모달 창 닫기!
        }
    }
    
    //core-Data---------------------
    
    func dateToStringChatTime() -> String {
        let curDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        return formatter.string(from: curDate)
    }

    func createItem(name: String, content: String)
    {
        let time = dateToStringChatTime()
        print(time)
        let newitem = Memo(context: context)
        newitem.name = name
        newitem.date = time
        newitem.contents = content
        
        //save at coredata
        do{
            try context.save()
        }
        catch{
            
        }
    }
}
