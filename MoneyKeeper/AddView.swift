//
//  AddView.swift
//  MoneyKeeper
//
//  Created by Nikita Yashin on 19.08.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Название", text: $name)
                    Picker("Тип", selection: $type) {
                        ForEach(self.types, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Стоимость", text: $amount)
                        .keyboardType(.numberPad)
                }
                Button(action: {
                    if let actualAmount = Int(self.amount) {
                        let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                        self.expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Сохранить")
                })
                .navigationBarTitle("Добавить")
            }
            Button(action: {
                //
            }, label: {
                Text("Сохранить")
            })
            
        }
        
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}

