//
//  ContentView.swift
//  SampleCK
//
//  Created by Chirag Ramani on 11/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var parameters = [Parameter]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Params fetched from CloudKit!")
            ForEach(parameters, id: \.metadata) { parameter in
                Text(parameter.name + "=" + parameter.type.debugDescription)
            }
        }.onAppear {
            Task {
                self.parameters = try! await ParamsService().fetchParameters()
                print(self.parameters)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
