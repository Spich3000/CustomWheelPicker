//
//  DefaultPicker.swift
//  CustomWheelPicker
//
//  Created by Дмитрий Спичаков on 03.07.2023.
//

import SwiftUI

struct DefaultPicker: View {
    
    @State private var todaysDate: Date = Date()
    
    var body: some View {
        DatePicker(selection: $todaysDate, displayedComponents: .date, label: {
            EmptyView()
                .frame(width: 0)
        })
        .datePickerStyle(.wheel)
        .padding(.trailing, 35)
    }
}

struct DefaultPicker_Previews: PreviewProvider {
    static var previews: some View {
        DefaultPicker()
    }
}
