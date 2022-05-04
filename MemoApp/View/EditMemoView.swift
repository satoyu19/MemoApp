//
//  EditMemoView.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI

struct EditMemoView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var title: String
    @State private var content: String
    @State private var memo: Memo
    //選択されたMemoを取得
    init(memo: Memo) {
        self.memo = memo
        title = memo.title ?? ""
        content = memo.content ?? ""
    }
    
    var body: some View {
        VStack {
            TextField("タイトル", text: $title)
                .font(.title)
            TextEditor(text: $content)
                .font(.body)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {saveMemo()}) {
                    Text("保存")
                }
            }
        }
    }
    //Memoの内容を変更、保存
    private func saveMemo() {
        
        memo.title = title
        memo.content = content
        memo.updateAt = Date()
        
        try? viewContext.save()
    }
}

struct EditMemoView_Previews: PreviewProvider {
    static var previews: some View {
        EditMemoView(memo: Memo())
    }
}
