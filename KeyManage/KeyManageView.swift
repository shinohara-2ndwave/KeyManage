//
//  KeyManageView.swift
//  KeyManage
//
//  Created by y.shinohara on 2021/05/18.
//

import SwiftUI

struct KeyManageView: View {
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(0..<5) { index in
                        NavigationLink(
                            destination: KeyManageUpdateView()){
                                Text("Row \(index)")
                            }
                    }
                }

                NavigationLink(
                    destination: KeyManageCreateView()){
                        Text("Move To CreateView")
                    }
                .navigationBarTitle("鍵貸出管理")

            }
        }
    }
}

// 一覧
struct KeyManageListView: View {
    var body: some View{
        Text("KeyManageListView")
    }
}

// 登録
struct KeyManageCreateView: View {
    var body: some View {
        VStack{
            Text("CreateView")
        }
    }
}

// 更新
struct KeyManageUpdateView: View {
    var body: some View {
        VStack{
            Text("UpdateView")
        }
    }
}


struct KeyManageView_Previews: PreviewProvider {
    static var previews: some View {
        KeyManageView()
    }
}
