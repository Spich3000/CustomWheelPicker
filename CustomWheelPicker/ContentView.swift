//
//  ContentView.swift
//  CustomWheelPicker
//
//  Created by Дмитрий Спичаков on 01.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected: String = "2"
    
    var body: some View {
        ZStack {
            Color.white
            CustomPicker(selected: self.$selected)
        }
        .padding()
    }
}

let data: [String] = ["1", "2", "3"]

struct CustomPicker: UIViewRepresentable {
    
    @Binding var selected: String

    func makeCoordinator() -> CustomPicker.Coordinator {
        return CustomPicker.Coordinator(parent1: self)
    }
    
    func makeUIView(context : UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        let picker = UIPickerView()
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(
        _ uiView : CustomPicker.UIViewType ,
        context : UIViewRepresentableContext<CustomPicker>
    ) {
        
    }
    
    class Coordinator: NSObject,UIPickerViewDelegate,UIPickerViewDataSource {
                
        var parent : CustomPicker
        
        init(parent1 : CustomPicker) {
            parent = parent1
        }
        
        func pickerView(
            _ pickerView: UIPickerView,
            numberOfRowsInComponent component: Int
        ) -> Int {
            return data.count
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(
            _ pickerView: UIPickerView,
            viewForRow row: Int,
            forComponent component: Int,
            reusing view: UIView?
        ) -> UIView {
            
            let view = UIView(frame: CGRect(
                x : 0,
                y : 0,
                width: UIScreen.main.bounds.width - 100,
                height: 40))
            
            let label = UILabel(frame:  CGRect(
                x : 0,
                y : 0,
                width : view.bounds.width,
                height: view.bounds.height))
            
            label.text = data[row]
            label.textColor = .black
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 30, weight: .bold)
            
            view.backgroundColor = .red
            
            view.addSubview(label)
            
            view.clipsToBounds = true
            view.layer.cornerRadius = 15
            
            return view
        }
        
        func pickerView(
            _ pickerView: UIPickerView,
            widthForComponent component: Int
        ) -> CGFloat {
            return UIScreen.main.bounds.width - 100
        }
        
        func pickerView(
            _ pickerView: UIPickerView,
            rowHeightForComponent component: Int
        ) -> CGFloat {
            return 40
        }
        
        func pickerView(
            _ pickerView: UIPickerView,
            didSelectRow row: Int,
            inComponent component: Int
        ) {
            self.parent.selected = data[row]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
