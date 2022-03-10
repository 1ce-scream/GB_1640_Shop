//
//  AppDelegate.swift
//  GB_1640_Shop
//
//  Created by Vitaliy Talalay on 03.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        getTestRequestsResults()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    private func getTestRequestsResults() {
        sendTestRegistrationRequest()
        sendTestLoginRequest()
        sendTestChangeUserDataRequest()
        sendTestLogOutRequest()
    }
    
    private func sendTestLoginRequest() {
        let request = requestFactory.makeAuthRequestFatory()
        
        request.login(userName: "Somebody",
                      password: "mypassword") { response in
            switch response.result {
            case let .success(login):
                print("testLogin: ", login)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func sendTestLogOutRequest() {
        let request = requestFactory.makeLogOutRequestFactory()
        
        request.logOut(userId: 1) { response in
            switch response.result {
            case let .success(logOut):
                print("testLogOut ", logOut)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func sendTestRegistrationRequest() {
        let request = requestFactory.makeRegistrationRequestFactory()
        
        request.registration(userID: 123,
                             userName: "Somebody",
                             password: "mypassword",
                             email: "email") { response in
            switch response.result {
            case let .success(regData):
                print("testRegistration ", regData)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func sendTestChangeUserDataRequest() {
        let request = requestFactory.makeChangeUserDataFactory()
        
        request.changeUserData(userID: 123,
                               userName: "Somebody2",
                               password: "mypassword2",
                               email: "email2") { response in
            switch response.result {
            case let .success(regData):
                print("testChangeUserData ", regData)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
}

