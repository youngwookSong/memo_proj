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
        print("취소")
        //alert로 취소하면 저장내용 없어진다고 구현
        self.dismiss(animated: true, completion: nil)
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
    
    func updateItem(item: Memo, newName: String, newContent: String)
    {
        item.name = newName //제목 업데이트
        item.date = Date() //시간 업데이트
        item.contents = newContent //내용 업데이트
        do{
            try context.save()
        }
        catch{
            
        }
    }

}
