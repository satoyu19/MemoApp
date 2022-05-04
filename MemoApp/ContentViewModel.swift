//
//  ContentViewModel.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    //環境値の読み取り、CoreDataを使った場合のmanagedObjectContext?
    @Environment(\.managedObjectContext) @Published private var viewContext
    
    //@FetchRepuest=CoreDate内のデータにアクセスできる、SwiftUIとCoreDateを連携させる
    ///Parameters:
    ///   - entity: The description of the Core Data entity to fetch.
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    //エンティティは、管理対象オブジェクトClassに対してid、またはデータベースの例えを使用して、テーブルが行に対して何であるかを示す。
    @FetchRequest(entity: Memo.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "updateAt", ascending:false)],
                  animation: .default) var fetchedMemoList: FetchedResults<Memo>
    //CoreDateが変更されることでViewも再描画される
    private func deleteMemo(offsets: IndexSet){
        offsets.forEach{ index in
            viewContext.delete(fetchedMemoList[index])
        }
        //削除後、保存
        try? viewContext.save()
    }
}
