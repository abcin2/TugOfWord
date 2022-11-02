//
//  SettingsView.swift
//  Tug-of-Word
//
//  Created by Robert Alec Hovey on 10/5/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settingsViewModelData: SettingsViewModel
    // this changes and persists the change, but it's not updating on the keyboard itself
    
    var body: some View {
        NavigationView {
            List {
                //keyboard color - could use enum for this
                Picker("Keyboard Style", selection: $settingsViewModelData.keyboardTheme) {
                    ForEach(KeyboardTheme.KeyboardColorTheme.allCases, id:\.self) { item in
                        Text(item.description).tag(item)
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsViewModel())
    }
}
