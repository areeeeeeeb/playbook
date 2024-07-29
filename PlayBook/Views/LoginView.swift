//
//  LoginView.swift
//  PlayBook
//
//  Created by Areeb Rasul on 2024-05-05.
//

import Foundation

import SwiftUI

struct LoginView: View {
    @State var emailID: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 10) {
            TextField("Email", text: $emailID)
                .textContentType(.emailAddress)
                .border(1, .gray.opacity(0.4))
            SecureField("Password", text: $password)
                .textContentType(.password)
                .border(1, .gray.opacity(0.4))
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension View{
    func border(_ width: CGFloat,_ color: Color)->some View{
        self
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle (cornerRadius: 5, style: .continuous)
                    .stroke(color, lineWidth: width)
            }
    }
}
            
