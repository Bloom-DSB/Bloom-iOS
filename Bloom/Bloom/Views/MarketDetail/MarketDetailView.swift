////
////  MarketDetailView.swift
////  Bloom
////
////  Created by 조다은 on 6/6/24.
////
//
//import SwiftUI
//
//struct MarketDetailView: View {
//    @StateObject private var viewModel = MarketDetailViewModel()
//    @Environment(\.presentationMode) var presentationMode
//    
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    ZStack(alignment: .bottomTrailing) {
//                        Image(viewModel.marketDetail.products.first?.imageName ?? "defaultImage")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(height: 300)
//                            .clipped()
//                        
//                        Button(action: {
//                            // 관심 토글 액션
//                        }) {
//                            Image(systemName: "heart.fill")
//                                .resizable()
//                                .frame(width: 24, height: 24)
//                                .padding()
//                                .foregroundStyle(Color.pointOrange)
//                                .clipShape(Circle())
//                        }
//                        .padding(10)
//                    }
//                    
//                    VStack(alignment: .leading, spacing: 8) {
//                        HStack {
//                            Text(viewModel.marketDetail.status)
//                                .font(.pretendardMedium(size: 14))
//                                .frame(width: 60, height: 24)
//                                .foregroundStyle(viewModel.marketDetail.status == "운영중" ? Color.operating : Color.preparing)
//                                .background(viewModel.marketDetail.status == "운영중" ? Color(hex: "E4F7FF"): Color(hex: "FFE1E1"))
//                                .cornerRadius(99)
//                            
//                            Spacer()
//                        }
//                        
//                        Text(viewModel.marketDetail.name)
//                            .font(.pretendardBold(size: 24))
//                            .bold()
//                        
//                        Text(viewModel.marketDetail.description)
//                            .font(.pretendardRegular(size: 14))
//                            .foregroundStyle(Color.gray3)
//                            .padding(.vertical, 5)
//                        
//                        HStack(alignment: .center, spacing: 25, content: {
//                            Button(action: {
//                                // 전화 액션
//                            }) {
//                                VStack {
//                                    Image(systemName: "phone")
//                                        .font(.title2)
//                                        .foregroundStyle(Color.pointOrange)
//                                    Text("전화")
//                                        .font(.pretendardMedium(size: 11))
//                                        .foregroundStyle(Color.pointOrange)
//                                        .padding(.top, 1)
//                                }
//                            }
//                            Rectangle()
//                                .frame(width: 1, height: 34)
//                                .foregroundStyle(Color.pointOrange)
//                            
//                            Button(action: {
//                                // SNS 액션
//                            }) {
//                                VStack {
//                                    Image(systemName: "camera")
//                                        .font(.title2)
//                                        .foregroundStyle(Color.pointOrange)
//                                    Text("SNS")
//                                        .font(.pretendardMedium(size: 11))
//                                        .foregroundStyle(Color.pointOrange)
//                                        .padding(.top, 1)
//                                }
//                            }
//                            Rectangle()
//                                .frame(width: 1, height: 34)
//                                .foregroundStyle(Color.pointOrange)
//                            
//                            Button(action: {
//                                // 운영시간 액션
//                            }) {
//                                VStack {
//                                    Image(systemName: "clock")
//                                        .font(.title2)
//                                        .foregroundStyle(Color.pointOrange)
//                                    Text("운영시간")
//                                        .font(.pretendardMedium(size: 11))
//                                        .foregroundStyle(Color.pointOrange)
//                                        .padding(.top, 1)
//                                }
//                            }
//                            Rectangle()
//                                .frame(width: 1, height: 34)
//                                .foregroundStyle(Color.pointOrange)
//                            
//                            Button(action: {
//                                // 공유 액션
//                            }) {
//                                VStack {
//                                    Image(systemName: "square.and.arrow.up")
//                                        .font(.title2)
//                                        .foregroundStyle(Color.pointOrange)
//                                    Text("공유")
//                                        .font(.pretendardMedium(size: 11))
//                                        .foregroundStyle(Color.pointOrange)
//                                        .padding(.top, 1)
//                                }
//                            }
//                        })
//                        .frame(width: 353, height: 75)
//                        .background(Color.baseYellow)
//                        .cornerRadius(8)
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.top)
//                    .padding(.bottom, 10)
//                    
//                    Rectangle()
//                        .frame(height: 6)
//                        .foregroundStyle(Color.gray6)
//                        .background(Color.gray6)
//                    
//                    HStack {
//                        Text("판매 상품")
//                            .font(.pretendardSemiBold(size: 16))
//                        
//                        Spacer()
//                        
//                        NavigationLink(destination: MarketProductsView()) {
//                            HStack(spacing: 5) {
//                                Text("전체보기")
//                                    .font(.pretendardMedium(size: 14))
//                                    .foregroundStyle(Color.gray4)
//                                Image(systemName: "chevron.right")
//                                    .foregroundStyle(Color.gray4)
//                                    .frame(height: 5)
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                    .padding(.top, 10)
//                    
//                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
//                        ForEach(viewModel.marketDetail.products) { product in
//                            VStack(alignment: .leading) {
//                                Image(product.imageName)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(height: 100)
//                                    .clipped()
//                                    .cornerRadius(8)
//                                
//                                Text(product.name)
//                                    .font(.pretendardMedium(size: 14))
//                                    .foregroundStyle(Color.gray2)
//                                    .lineLimit(1)
//                                
//                                Text(product.price)
//                                    .font(.pretendardBold(size: 15))
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                    .padding(.bottom)
//                    
//                    Rectangle()
//                        .frame(height: 6)
//                        .foregroundStyle(Color.gray6)
//                        .background(Color.gray6)
//                    
//                    HStack {
//                        Text("위치")
//                            .font(.pretendardSemiBold(size: 16))
//                        
//                        Spacer()
//                        
//                        HStack(spacing: 5) {
//                            Image(systemName: "location")
//                                .foregroundStyle(Color.gray2)
//                            Text(viewModel.marketDetail.location)
//                                .font(.pretendardRegular(size: 15))
//                                .foregroundStyle(Color.gray2)
//                        }
//                        
//                    }
//                    .padding(.horizontal)
//                    .padding(.top, 10)
//                    
//                    VStack(alignment: .leading) {
//                        
//                        Image(viewModel.marketDetail.mapImageName)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 200)
//                            .clipped()
//                        
//                        HStack(alignment: .center, spacing: 7) {
//                            Image(systemName: "exclamationmark.circle")
//                                .foregroundStyle(Color.gray3)
//                            Text("강남역 바로 옆 초 역세권 짱짱 꽃집이랍니다.")
//                                .font(.pretendardRegular(size: 12))
//                                .foregroundStyle(Color.gray3)
//                        }
//                        .padding(.top, 5)
//                    }
//                    .padding(.horizontal)
//                    .padding(.top)
//                }
//            }
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
//        }
//        .navigationBarItems(leading: Button(action: {
//            presentationMode.wrappedValue.dismiss()
//        }) {
//            Image(systemName: "chevron.left")
//                .foregroundStyle(.black)
//        })
//    }
//}
//
//
//#Preview {
//    MarketDetailView()
//}
