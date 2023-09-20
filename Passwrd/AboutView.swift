//
//  AboutView.swift
//  Passwrd
//
//  Created by Niklas Peterson on 2023-09-19.
//
import SwiftUI

struct AboutView: View {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy";
        return formatter
    }()
    
    
    var body: some View {
        
        VStack() {
            VStack(alignment: .leading, spacing: 16) {
                
                VStack(alignment: .leading) {
                    Text("Passwrd")
                        .font(.title)
                    Text("Version: \(version())")
                        .font(.system(.footnote, design: .monospaced))
                        .foregroundColor(.secondary)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Made by Niklas")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Tuesday, September 19 (late at night 🌙)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Text("Your secure and easy-to-access password manager right in your macOS Menu Bar. Keep your passwords at your fingertips with just a few clicks.")
                    .multilineTextAlignment(.leading)
                    .font(.body)

            }
            
            Divider()
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Link(destination: URL(string: "https://github.com/niklaspeterson/passwrd")!) {
                        Text("Soruce Code on GitHub")
                    }
                    Text("|")
                    Link(destination: URL(string: "https://twitter.com/niklas_peterson")!) {
                        Text("Feedback / Support")
                    }
                    Text("|")
                    Link(destination: URL(string: "https://niklaspeterson.com")!) {
                        Text("Niklas Peterson © \(Date(), formatter: Self.dateFormatter)")
                    }
                }
            }
            
            
        }
        .frame(width: 480, height: 200)
        .padding()
    }
    
    func version() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version) (\(build))"
    }
}



struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
