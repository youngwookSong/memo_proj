//
//  Memo+CoreDataProperties.swift
//  my_memo
//
//  Created by 송영욱 on 2021/03/16.
//
//

import Foundation
import CoreData

extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var contents: String?

}

extension Memo : Identifiable {

}
