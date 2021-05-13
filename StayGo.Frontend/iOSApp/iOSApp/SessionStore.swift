import SwiftUI
import Firebase

class SessionStore : ObservableObject {
  @Published var session: User?
  var isLoggedIn: Bool { session != nil}
  var handle: AuthStateDidChangeListenerHandle?
    

  init () {
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
      if let user = user {
          self.session = User(
            uid: user.uid,
            email: user.email,
            emailVerified: user.isEmailVerified,
            displayName: user.displayName
        )
     } else {
        self.session = nil
      }
    }
  }

  deinit {
    if let handle = handle {
       Auth.auth().removeStateDidChangeListener(handle)
    }
  }
}
