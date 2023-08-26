//
//  EditableTextView.swift
//  Clicker
//
//  Created by Clément Lopez on 25/08/2023.
//

import SwiftUI

struct EditableTextView: View {
    let title:String
    @State private var isEditing = false
    @Binding var editedText:String
    var body: some View {
        HStack{
            if isEditing == true {
                TextField(title, text: $editedText)
                    .frame(width: 300.0)
                    .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            } else {
                Text(editedText)
                    .frame(width: 300.0)
            }
            Image(systemName: "pencil.circle").onTapGesture {
                isEditing.toggle()
            }
        }.padding()
    }
}

struct EditableTextView_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextView(
            title: "Pseudo",  editedText: .constant("Leonard"))
            .previewLayout(.sizeThatFits)
    }
}
