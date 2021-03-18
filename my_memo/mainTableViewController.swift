//
//  mainTableViewController.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/16.
//

import UIKit

class mainTableViewController: UITableViewController {
    
    @IBOutlet var tableviewmain: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [Memo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Memo!"
        getAllItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //이거 그냥 모달로 하면 이 주기가 안생김. 그래서 present를 full screen으로 해야됨!!!
    //그냥 모달에서 되는법 생각해보기
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getAllItems()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return models.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = models[indexPath.row] //model안의 데이터를 불러옴
        cell.textLabel?.text = model.name //셀에 model의 index에 해당하는걸 표시
        cell.detailTextLabel?.text = "\(model.date!)"
        return cell
    }
    
    
    //core Data------------------------
    func getAllItems() //화면에 뿌려주는거
    {
        do
        {
            models = try context.fetch(Memo.fetchRequest())
            
            DispatchQueue.main.async { // data는 백그라운드이기때문에 main에서 놓으라는 명령이 필요
                self.tableviewmain.reloadData()
            }
        }
        catch
        {
            //error
        }
        
    }
    
    func createItem(name: String, content: String)
    {
        let newitem = Memo(context: context)
        newitem.name = name
        newitem.date = Date()
        newitem.contents = content
        
        //save at coredata
        do{
            try context.save()
        }
        catch{
            
        }
        getAllItems()
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
        getAllItems()
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
        getAllItems()
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
