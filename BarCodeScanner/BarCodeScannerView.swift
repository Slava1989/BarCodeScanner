//
//  ContentView.swift
//  BarCodeScanner
//
//  Created by Slava Chirita on 04.01.2024.
//

import SwiftUI

struct BarCodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var isShowingAlert = false
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(scannedCode.isEmpty ? .red : .green)
                    .padding()
                
                Button {
                    isShowingAlert = true
                } label: {
                    Text("Tap Me")
                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(isPresented: $isShowingAlert, content: {
                Alert(title: Text("Test"), 
                      message: Text("This is a test"),
                      dismissButton: .default(Text("Ok")))
            })
        }
    }
}

#Preview {
    BarCodeScannerView()
}
