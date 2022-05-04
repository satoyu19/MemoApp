//
//  EditMemoViewModel.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI

class EditMemoViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) var viewContext
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var memo: Memo?
    //Memoの内容を変更、保存
        func saveMemo() {
            if memo != nil{
                memo!.title = title
                memo!.content = content
                memo!.updateAt = Date()
            }
            try? viewContext.save()
        }
}

