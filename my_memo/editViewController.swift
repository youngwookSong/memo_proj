//
//  editViewController.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/19.
//

import UIKit

class editViewController: UIViewController {
    
    
    @IBOutlet weak var TitleEdit: UITextField!
    @IBOutlet weak var ContentsEdit: UITextView!
    
    private var models = [Memo]()
    var indexx : Int? //prepare로 앞에서 인덱스 정보만 가져옴
    
    @IBAction func cancel(_ sender: Any) {
        print("취소----")
        let sheet = UIAlertController(title: "경고", message: "지금 취소 시 내용이 저장되지 않습니다! 그래도 창을 닫을까요?", preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "Yes!", style: .destructive, handler: { _ in self.dismiss(animated: true, completion: nil)  }))
        sheet.addAction(UIAlertAction(title: "No!", style: .cancel, handler: nil))
        present(sheet, animated: true)
        
    }
    
    @IBAction func save(_ sender: Any) {
        print("저장 완료!")
        if let idx = indexx
        {
            if let title = TitleEdit.text
            {
                self.updateItem(item: models[idx], newName: title, newContent: ContentsEdit.text)
                self.dismiss(animated: true, completion: nil) //모달 창 닫기!
            }
        }        
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext //이거 나중에 데이터 옮기는거 해보자..

    override func viewDidLoad() {
        super.viewDidLoad()
        //getallitem 데이터 가져오기
        do{
            models = try context.fetch(Memo.fetchRequest())
        }
        catch{
        }
        
        //기존 데이터 표시
        if let idx = indexx
        {
            TitleEdit.text = models[idx].name
            ContentsEdit.text = models[idx].contents
        }
    }
    
    func dateToStringChatTime() -> String {
        let curDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        return formatter.string(from: curDate)
    }
    //한국시간으로 표기 Date()가 아니라 스트링으로!
    
    func updateItem(item: Memo, newName: String, newContent: String)
    {
        let time = self.dateToStringChatTime()
        print(time)
        item.name = newName //제목 업데이트
        item.date = time //시간 업데이트
        item.contents = newContent //내용 업데이트
        do{
            try context.save()
        }
        catch{
        }
    }

}
