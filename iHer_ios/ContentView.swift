//
//  ContentView.swift
//  iHer_ios
//
//  Created by Dustin yang on 6/19/21.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject var streamData = StreamViewModel()
    @AppStorage("log_Status") var logStatus = false
    
    var body: some View {
        
        NavigationView{
            
            if !logStatus{
                Login()
                    .navigationTitle("Login")
            }
            else{
                
                ChannelView()
            }
        }
        .alert(isPresented: $streamData.error, content: {
            
            Alert(title: Text(streamData.errorMsg))
        })
        .overlay(
            ZStack{
                
                
                // New Channel View....
                if streamData.createNewChannel{CreateNewChannel()}
                
                // Lodaing Screen...
                if streamData.isLoading{LoadingScreen()}
            }
        )
        .environmentObject(streamData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
