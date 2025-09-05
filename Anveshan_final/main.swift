print("ballu pagal");

import SwiftUI

struct ContentView: View {
    @State private var userInput: String = ""
    @State private var result: String = "Enter text or a link to verify"

    var body: some View {
        VStack {
            Text("AI Fact-Check Bot")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            TextField("Paste text or link here...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: verifyFact) {
                Text("Check Fact")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text(result)
                .padding()
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    func verifyFact() {
        FactCheckService().checkFact(input: userInput) { response in
            DispatchQueue.main.async {
                self.result = response
            }
        }
    }
}
