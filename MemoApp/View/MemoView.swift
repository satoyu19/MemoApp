//
//  MemoView.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/04.
//

import SwiftUI

struct MemoView: View {
    
    var title: String
    var stringUpdatedAt: String
    var content: String
    
    //List用のView
    var body: some View {
                VStack{
                    Text(title)
                        .foregroundColor(.blue)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(1)
                        Text(stringUpdatedAt)
                            .font(.caption)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(content)
                            .font(.caption)
                            .lineLimit(5)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                }
    }
}

