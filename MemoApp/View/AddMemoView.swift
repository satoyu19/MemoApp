//
//  AddMemoView.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//
//
import SwiftUI

struct AddMemoView: View {
    
    //環境値の読み取り、CoreDataを使った場合のmanagedObjectContext?
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentation
    @State private var title: String = ""
    @State private var context: String = ""
    
    var body: some View {
        VStack{
            TextField("タイトル", text: $title)
                .font(.title)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(Color.orange, lineWidth: 4.0)
                        .padding(-8.0)
                )
                .padding(16.0)
            TextEditor(text: $context)
                .font(.body)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                        .stroke(Color.orange, lineWidth: 4.0)
                        .padding(-8.0)
                )
                .padding(16.0)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {addMemo()}){
                    Text("保存")
                }
            }
        }
    }
    
    private func addMemo(){
        let memo = Memo(context: viewContext)
        memo.title = title
        memo.content = context
        memo.createAt = Date()
        memo.updateAt = Date()
        
        //生成したインスタンスをCoreDateに保存,open func save() throws
        try? viewContext.save()
        
        //メモが追加されたら遷移した画面を閉じる
        presentation.wrappedValue.dismiss()
    }
}

struct AddMemoView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemoView()
    }
}
