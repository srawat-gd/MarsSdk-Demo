//
//  ContentView.swift
//  SampleToothPick
//
//  Created by Shivam Rawat on 01/04/24.
//

import SwiftUI
import MarsSdk

struct ContentView: View {
    class palette: IMarsPalette {
        var primaryColor: Color = .blue
        var secondaryColor: Color = .yellow
        var ascentColor: Color = .red
        var fontName: String =  "MagicMonolines"
    }
    
    class surveyConfig : ISurveyConfigs {
        class serverConfig: IServerConfig {
            var clientId: String = ""
            var secretId: String = ""
            var serverUrl: String = "https://graphql-demo.mead.io/"
        }
        var serverConfig: IServerConfig = serverConfig()
    }

    var mars = try? SurveySDK(configs: surveyConfig(), palette: palette())
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.custom("MagicMonolines", size: 18))

            Text("Hello, world!")
            Button("Show") {
                if let mars {
                    mars.displaySurvey()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
