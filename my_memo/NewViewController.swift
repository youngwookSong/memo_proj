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
        let sheet = UIAlertController(title: "경고", message: "지금 취소 시 내용이 저장되지 않습니다! 그래도 창을 닫을까요?", preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "Yes!", style: .destructive, handler: { _ in self.dismiss(animated: true, completion: nil)  }))
        sheet.addAction(UIAlertAction(title: "No!", style: .cancel, handler: nil))
        present(sheet, animated: true)
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
