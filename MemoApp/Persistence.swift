//
//  Persistence.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        //viewContext=NSManagedObjectContext="NSManagedObjectのサブクラス"を管理するクラス。
        let viewContext = result.container.viewContext
//        for index in 0..<10 {
//            let newMemo = Memo(context: viewContext)
//               newMemo.title = "メモタイトル\(index + 1)"
//               newMemo.content = "メモ\(index + 1)の内容が記載されています"
//               newMemo.createAt = Date()
//               newMemo.updateAt = Date()
//        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    //NSPersistentContainerは、マネージドオブジェクトモデル（NSManagedObjectModel）、永続ストアコーディネータ（NSPersistentStoreCoordinator）、マネージドオブジェクトコンテキスト（NSManagedObjectContext）の作成を処理し、コアデータスタックの作成と管理を簡素化します。
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MemoApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
