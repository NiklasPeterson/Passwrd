//
//  AboutView.swift
//  Passwrd
//
//  Created by Niklas Peterson on 2023-09-19.
//
import SwiftUI
import LaunchAtLogin

struct AboutView: View {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy";
        return formatter
    }()
    
    
    var body: some View {
        
        VStack(alignment: .center) {
            HStack(alignment: .top, spacing: 24) {
                
                Image(nsImage: NSApp.applicationIconImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 160, height: 160)
                    .padding(-16) // Hack to remove padding
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading) {
                        if ProcessInfo.processInfo.operatingSystemVersion.majorVersion <= 13 {
                            HStack {
                                Text("Passwrd")
                                    .font(.title)
                                Spacer()
                                LaunchAtLogin.Toggle()
                            }
                        } else {
                            Text("Passwrd")
                                .font(.title)
                        }
                        
                        Text("Version: \(version())")
                            .font(.system(.footnote, design: .monospaced))
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Your secure and easy-to-access password manager right in your macOS Menu Bar. Keep your passwords at your fingertips with just a few clicks.")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    

                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Made by [Niklas](https://twitter.com/niklas_peterson)")
                        .foregroundColor(.primary)
                        
                        Text("Late night of Tuesday, September 19 2023")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    
                        
                }
            }
            
            Divider()
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Link(destination: URL(string: "https://twitter.com/niklas_peterson")!) {
                        Text("Feedback & Support")
                            .font(.footnote)
                    }
                    
                    Text("|")
                
                    Link(destination: URL(string: "https://github.com/niklaspeterson/passwrd")!) {
                        Text("Soruce Code")
                            .font(.footnote)
                    }
                    
                    Text("|")
                    Link(destination: URL(string: "https://niklaspeterson.com")!) {
                        Text("Niklas Peterson © \(Date(), formatter: Self.dateFormatter)")
                            .font(.footnote)
                    }
                }
            }
            
            
        }
        .frame(width: 480, height: 216)
        .padding(24)
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
