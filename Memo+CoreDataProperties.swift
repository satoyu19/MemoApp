//
//  Memo+CoreDataProperties.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var createAt: Date?
    @NSManaged public var updateAt: Date?

}

extension Memo : Identifiable {
    // stringUpdatedAtを呼び出すとString型のupdatedAtが返却される
        public var stringUpdatedAt: String { dateFomatter(date: updateAt ?? Date()) }
        
        func dateFomatter(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")

            return dateFormatter.string(from: date)
}
}
