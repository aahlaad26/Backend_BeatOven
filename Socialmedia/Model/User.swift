//
//  User.swift
//  Socialmedia
//
//  Created by mathangy on 27/02/24.
//
import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct User: Identifiable, Codable,Hashable {
    @DocumentID var id: String?
    var username: String
    var userbio: String
    var userbiolink: String
    var userid: String
    var useremail: String
    var userprofileURL: URL
    
    enum CodingKeys: CodingKey {
        case id
        case username
        case userbio
        case userbiolink
        case userid
        case useremail
        case userprofileURL
    }
}
extension User{
    static var MOCK_USERS:[User] = [

    
    ]
}
