//
//  CryptoHomeView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 16.12.2023.
//

import SwiftUI

struct CryptoHomeView: View {    
    @Binding var currentScreen: Screens
    @State private var isShowingDetail = false
    @State private var selectedUIImage = ""
    @Namespace var animation
    @State var selectedUIImageId: UUID = UUID()

    var body: some View {
        ZStack {
            if(isShowingDetail) {
                CryptoView(isShowingDetail: $isShowingDetail, animation: animation, selectedUIImage: selectedUIImage, imageId: selectedUIImageId)
            } else {
                VStack(alignment: .leading, spacing: 20) {
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.1)) {
                            currentScreen = .Home
                        }
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Home")
                        }
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding()
                    }
                    ForEach(cryptoList, id: \.imageId) { crypto in
                        HStack(spacing: 15) {
                            Image(crypto.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 50))
                                .matchedGeometryEffect(id: crypto.imageId, in: animation, anchor: .top)
                                .padding(.vertical, 10)
                                .padding(.leading, 10)
                            Text(crypto.containerDescription)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundStyle(Color("DarkBlue1"))
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(.softBlue)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(.horizontal, 20)
                        .onTapGesture {
                            withAnimation(.snappy(duration: 0.4)) {
                                selectedUIImage = crypto.imageName
                                selectedUIImageId = crypto.imageId
                                isShowingDetail.toggle()
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("ClearDark"))
    }
}

#Preview {
    CryptoHomeView(currentScreen: .constant(.Crypto))
}
