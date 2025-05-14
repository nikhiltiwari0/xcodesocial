//
//  ContentView.swift
//  testProduct
//
//  Created by Nikhil Tiwari on 5/13/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab: Tab = .feed
    
    enum Tab {
        case feed, post, profile
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            contentView
            Divider()
            bottomBar
        }
        .background(Color(.systemGray6))
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var contentView: some View {
        switch selectedTab {
        case .feed:
            return AnyView(feedView)
        case .post:
            return AnyView(postView)
        case .profile:
            return AnyView(profileView)
        }
    }
    
    private var feedView: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray)
                        .frame(height: 200)
                        .overlay(
                            Text("Username")
                                .fontDesign(.monospaced)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .padding(.leading, 12),
                            alignment: .topLeading
                        )
                        .overlay(
                            Text("Date")
                                .fontDesign(.monospaced)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .padding(.trailing, 12),
                            alignment: .topTrailing
                        )
                        .overlay(
                            Text("Post \(index + 1)")
                                .fontDesign(.monospaced)
                                .foregroundColor(.white)
                        )
                        .shadow(color: Color.gray.opacity(0.2), radius: 2, x: 0, y: 1)
                }
            }
            .padding()
        }
    }
    
    private var postView: some View {
        VStack {
            Spacer()
            Text("Create a Post")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
    private var profileView: some View {
        VStack {
            Spacer()
            Text("User Profile")
                .font(.headline)
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
    private var bottomBar: some View {
        HStack {
            Spacer()
            Button(action: { selectedTab = .feed }) {
                VStack {
                    Image(systemName: "list.bullet")
//                    Text("FEED")
                }
                .font(.title)
            }
            Spacer()
            Button(action: { selectedTab = .post }) {
                VStack {
                    Image(systemName: "plus.circle")
//                    Text("POST")
                }
                .font(.title)
            }
            Spacer()
            Button(action: { selectedTab = .profile }) {
                VStack {
                    Image(systemName: "person.crop.circle")
//                    Text("PROFILE")
                }
                .font(.title)
            }
            Spacer()
        }
        .padding(.top, 15)
        .padding(.bottom, 15)
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .font(.caption)
    }
}

#Preview {
    ContentView()
}
