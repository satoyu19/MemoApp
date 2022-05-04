//
//  AddMemoViewModel.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI

class AddMemoViewModel: ObservableObject {
    //環境値の読み取り、CoreDataを使った場合のmanagedObjectContext?
    @Environment(\.managedObjectContext) private var viewContext
    @Published var title: String = ""
    @Published var context: String = ""
    
    func addMemo(){
        let memo = Memo(context: viewContext)
        memo.title = title
        memo.content = context
        memo.createAt = Date()
        memo.updateAt = Date()

        //生成したインスタンスをCoreDateに保存,open func save() throws
        try? viewContext.save()

    }
}

