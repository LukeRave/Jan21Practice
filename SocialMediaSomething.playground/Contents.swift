import Foundation
import Darwin

struct Comment {
    var commentBody: String
    var creator: String
    var comments: [Comment]
    var rating: Int
    init(creator: String, commentBody: String) {
        self.commentBody = commentBody
        self.creator = creator
        self.comments = []
        self.rating = 0
    }
    mutating func upvote() {
        self.rating += 1
    }
    mutating func downvote() {
        self.rating -= 1
    }
    mutating func newComment(creator: String, commentBody: String) {
        self.comments.append(Comment(creator: creator, commentBody: commentBody))
    }
    mutating func updateComment(commentBody: String) {
        self.commentBody = commentBody
    }
}

struct Post {
    var postBody: String
    var creator: String
    var comments: [Comment]
    var rating: Int
    init(creator: String, postBody: String) {
        self.postBody = postBody
        self.creator = creator
        self.comments = []
        self.rating = 0
    }
    mutating func updatePost(postBody: String) {
        self.postBody = postBody
    }
    mutating func newComment(creator: String, commentBody: String) {
        self.comments.append(Comment(creator: creator, commentBody: commentBody))
    }
    mutating func upvote() {
        self.rating += 1
    }
    mutating func downvote() {
        self.rating -= 1
    }
}

struct User {
    var fName: String
    var lName: String
    var uName: String
    var email: String
    var dateOfBirth: Date
    var posts: [Post]
    init(fName: String, lName: String, uName: String, email: String, dateOfBirth: Date) {
        self.fName = fName
        self.lName = lName
        self.uName = uName
        self.email = email
        self.dateOfBirth = dateOfBirth
        self.posts = []
    }
    mutating func updateEmail(newEmail: String) {
        self.email = newEmail
    }
    mutating func createPost(postBody: String) {
        self.posts.append(Post(creator: self.uName, postBody:postBody))
    }
    
}
