import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController(rootViewController: ViewController())
        window!.makeKeyAndVisible()
        
        Fabric.with([Crashlytics.self])
        
        // TODO: Move this to where you establish a user session
        self.logUser()

        return true
    }
    
    func logUser() {
        CLSLogv("%@", getVaList(["logUser call"]))
        Crashlytics.sharedInstance().setUserEmail("user@fabric.io")
        Crashlytics.sharedInstance().setUserIdentifier("12345")
        Crashlytics.sharedInstance().setUserName("Test User")
    }
}

