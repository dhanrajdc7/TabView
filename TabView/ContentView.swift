//
//  ContentView.swift
//  TabView
//
//  Created by Dhanraj Sudhir Chavan on 16/04/20.
//  Copyright © 2020 Dhanraj Chavan. All rights reserved.
//

import SwiftUI
import AppKit
import Combine

struct ContentView: View {
    
    @ObservedObject var viewSwitcher = ViewSwitcher()
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                
                VStack(alignment: .leading, spacing: 10) {
                                        
                    Image(nsImage: NSImage(named: self.viewSwitcher.currentView == "home" ? "homeTab1" : "homeTab2")!)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                        .onTapGesture {
                            self.viewSwitcher.currentView = "home"
                        }
                    
                    Image(nsImage: NSImage(named: self.viewSwitcher.currentView == "settings" ? "settingsTab1" : "settingsTab2")!)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                        .onTapGesture {
                            self.viewSwitcher.currentView = "settings"
                        }
                    
                    Spacer()
                }.frame(width: 30)
                
                Divider()
                
                if self.viewSwitcher.currentView == "home" {
                    HomeTab()
                } else if self.viewSwitcher.currentView == "settings" {
                    SettingsTab()
                }
                
                Spacer(minLength: 10)
            }.padding(.horizontal, 10)
        }.frame(minWidth: 600, minHeight: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
