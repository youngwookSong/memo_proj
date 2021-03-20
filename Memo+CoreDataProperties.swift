//
//  Memo+CoreDataProperties.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/20.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var contents: String?
    @NSManaged public var date: Date?
    @NSManaged public var name: String?

}

extension Memo : Identifiable {

}
