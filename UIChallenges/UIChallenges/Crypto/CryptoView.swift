//
//  CryptoView.swift
//  UIChallenges
//
//  Created by Andrei Bakos on 13.12.2023.
//

import SwiftUI

struct CryptoView: View {
    @Binding var isShowingDetail: Bool
    var animation: Namespace.ID
    var selectedUIImage: String
    var imageId: UUID

    var body: some View {
        ZStack {
            ZStack {
                VStack(alignment: .center, spacing: 28) {
                    Image(selectedUIImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .matchedGeometryEffect(id: imageId, in: animation, anchor: .top)
                        .onTapGesture {
                            withAnimation(.smooth(duration: 0.3)) {
                                isShowingDetail.toggle()
                            }
                        }

                    VStack(alignment: .leading) {
                        Text("Equillibrum #3429")
                            .foregroundColor(.white)
                            .font(Font.system(size: 25))
                            .fontWeight(.bold)

                        Text("Our Equilibrum collection promotes balance and calm.")
                            .foregroundStyle(Color("DarkBlue3"))
                            .padding(.vertical, 2)

                        VStack {
                            HStack {
                                HStack {
                                    Image("CryptoLogo")
                                    Text("0.041 ETH")
                                        .foregroundStyle(Color("DarkCyan"))
                                        .fontWeight(.bold)
                                }
                                Spacer()
                                HStack {
                                    Image(systemName: "clock.fill")
                                        .foregroundStyle(Color("SoftBlue"))
                                    Text("3 days left")
                                        .foregroundStyle(Color("SoftBlue"))
                                }
                            }
                            Rectangle()
                                .frame(height: 0.3)
                                .foregroundStyle(Color("DarkBlue2"))
                                .padding(.vertical, 5)
                                .clipShape(.rect(cornerRadius: 20))
                        }
                        .padding(.vertical)

                        HStack(spacing: 15) {
                            Image("UserProfile")
                            HStack {
                                Text("Creation of \(Text("Jules Wyvern").foregroundStyle(Color("SoftBlue")))")
                            }
                            .foregroundColor(Color("DarkBlue3"))
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(27)
            }
            .background(Color("DarkBlue1"))
            .clipShape(.rect(cornerRadius: 20))
            .padding(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("BgDark"))
    }
}

#Preview {
    CryptoView(
        isShowingDetail: .constant(false),
        animation: Namespace().wrappedValue,
        selectedUIImage: "ContentImage",
        imageId: UUID())
}
