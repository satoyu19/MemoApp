//
//  ContentView.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI
import CoreData

struct ContentView: View {

//環境値の読み取り、CoreDataを使った場合のmanagedObjectContext?
@Environment(\.managedObjectContext) private var viewContext

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

var body: some View {
    NavigationView{
        List{
            ForEach(fetchedMemoList) { memo in
                VStack{
                    Text(memo.title ?? "")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                    HStack{
                        Text(memo.stringUpdatedAt)
                            .font(.caption)
                            .lineLimit(1)
                        Text(memo.content ?? "")
                            .font(.caption)
                            .lineLimit(1)
                        Spacer()
                    }
                }
            }
        }
    }.navigationTitle("メモ")
        .navigationBarTitleDisplayMode(.automatic)
}
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
}
