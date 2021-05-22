//
//  KeyManageView.swift
//  KeyManage
//
//  Created by y.shinohara on 2021/05/18.
//

import SwiftUI

struct KeyManageView: View {
    @State var showRent = false
    @State var showReturn = false
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
                .toolbar{
                    ToolbarItem(placement: .bottomBar){
                        Text("貸出")
                            .onTapGesture {
                                self.showRent = true
                            }
                    }
                    ToolbarItem(placement: .bottomBar){
                        Text("返却")
                            .onTapGesture {
                                self.showReturn = true
                            }
                    }
                }
                // ナビゲーションリンクを非表示
                NavigationLink("", destination: KeyManageRentView(), isActive: $showRent)
                    .frame(width: 0, height: 0)
                    .hidden()
                    .navigationBarTitle("鍵貸出管理")
                NavigationLink("", destination: KeyManageReturnView(), isActive: $showReturn)
                    .frame(width: 0, height: 0)
                    .hidden()
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

// 貸出登録
struct KeyManageRentView: View {
    var keyNos = ["1","2","3","4","5","6","7"]
    var cardNos = ["000001","000002","000003","000004","000005","000006"]
    @State var keyNo = 0
    @State var cardNo = 0
    @State var status = 1
    @State var name = ""
    @State var rentAt = Date()
    @State var dueAt = Date()
    @State var returnAt = Date()
    
    @State var created = false

    var body: some View {
        Form{
            VStack{
                Picker("鍵No", selection: $keyNo){
                    ForEach(0..<keyNos.count){
                        Text(self.keyNos[$0])
                    }
                }
            }
            VStack{
                Picker("カードNo", selection: $cardNo){
                    ForEach(0..<cardNos.count){
                        Text(self.cardNos[$0])
                    }
                }
            }
            // 貸出日
            VStack{
                HStack{
                    Text("貸出日")
                    Spacer()
                }
                HStack{
                    DatePicker("貸出日", selection: $rentAt, displayedComponents: .date)
                        .labelsHidden()
                        .frame(height: 30)
                        .clipped()
                    Spacer()
                }
            }
            // 返却予定日
            VStack{
                HStack{
                    Text("返却予定日")
                    Spacer()
                }
                HStack{
                    DatePicker("返却予定日", selection: $dueAt, displayedComponents: .date)
                        .labelsHidden()
                        .frame(height: 30)
                        .clipped()
                    Spacer()
                }
            }
            // 氏名
            VStack{
                TextField("氏名", text: $name)
            }

            Button("登録", action: {
                // TODO: 登録処理を実装する
                self.created = true
            })
            .alert(isPresented: $created){
                Alert(title: Text("登録しました"))
            }
            // デバッグ用
//            VStack{
//                Text("selected: \(keyNos[keyNo])")
//                Text("selected: \(cardNos[cardNo])")
//                Text("inputed: \(name)")
//                Text("inputed: \(rentAt)")
//                Text("inputed: \(dueAt)")
//            }
        }
    }
}

// 返却登録
struct KeyManageReturnView: View {
    var keyNos = ["1","2","3","4","5","6","7"]
    var cardNos = ["000001","000002","000003","000004","000005","000006"]
    @State var keyNo = 0
    @State var cardNo = 0
    @State var status = 0
    @State var name = ""
    @State var rentAt = Date()
    @State var dueAt = Date()
    @State var returnAt = Date()
    
    @State var created = false

    var body: some View {
        Form{
            VStack{
                Picker("鍵No", selection: $keyNo){
                    ForEach(0..<keyNos.count){
                        Text(self.keyNos[$0])
                    }
                }
            }
            VStack{
                Picker("カードNo", selection: $cardNo){
                    ForEach(0..<cardNos.count){
                        Text(self.cardNos[$0])
                    }
                }
            }
            // 貸出日
            VStack{
                HStack{
                    Text("返却日")
                    Spacer()
                }
                HStack{
                    DatePicker("返却日", selection: $returnAt, displayedComponents: .date)
                        .labelsHidden()
                        .frame(height: 30)
                        .clipped()
                    Spacer()
                }
            }
            // 氏名
            VStack{
                TextField("氏名", text: $name)
            }
            Button("登録", action: {
                // TODO: 登録処理を実装する
                self.created = true
            })
            .alert(isPresented: $created){
                Alert(title: Text("登録しました"))
            }

            // デバッグ用
//            VStack{
//                Text("selected: \(keyNos[keyNo])")
//                Text("selected: \(cardNos[cardNo])")
//                Text("inputed: \(name)")
//                Text("inputed: \(rentAt)")
//                Text("inputed: \(dueAt)")
//            }
        }
    }
}
// 更新
struct KeyManageUpdateView: View {
    var keyNos = ["1","2","3","4","5","6","7"]
    var cardNos = ["000001","000002","000003","000004","000005","000006"]
    @State var keyNo = 0
    @State var cardNo = 0
    @State var status = 1
    @State var name = ""
    @State var rentAt = Date()
    @State var dueAt = Date()
    @State var returnAt = Date()
    
    @State var created = false

    var body: some View {
        Form{
            VStack{
                Picker("鍵No", selection: $keyNo){
                    ForEach(0..<keyNos.count){
                        Text(self.keyNos[$0])
                    }
                }
            }
            VStack{
                Picker("カードNo", selection: $cardNo){
                    ForEach(0..<cardNos.count){
                        Text(self.cardNos[$0])
                    }
                }
            }
            // 貸出日
            VStack{
                HStack{
                    Text("貸出日")
                    Spacer()
                }
                HStack{
                    DatePicker("貸出日", selection: $rentAt, displayedComponents: .date)
                        .labelsHidden()
                        .frame(height: 30)
                        .clipped()
                    Spacer()
                }
            }
            // 返却予定日
            VStack{
                HStack{
                    Text("返却予定日")
                    Spacer()
                }
                HStack{
                    DatePicker("返却予定日", selection: $dueAt, displayedComponents: .date)
                        .labelsHidden()
                        .frame(height: 30)
                        .clipped()
                    Spacer()
                }
            }
            // 氏名
            VStack{
                TextField("氏名", text: $name)
            }

            Button("登録", action: {
                // TODO: 登録処理を実装する
                self.created = true
            })
            .alert(isPresented: $created){
                Alert(title: Text("登録しました"))
            }
            // デバッグ用
//            VStack{
//                Text("selected: \(keyNos[keyNo])")
//                Text("selected: \(cardNos[cardNo])")
//                Text("inputed: \(name)")
//                Text("inputed: \(rentAt)")
//                Text("inputed: \(dueAt)")
//            }
        }
    }
}


struct KeyManageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KeyManageView()
            KeyManageView()
        }
    }
}
