import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        
        
        var numbers = [20, 19, 7, 12]
        numbers.map({ number in 3 * number })
        println(numbers)
        println(numbers.map({ number in 3 * number }))
        numbers = [1, 5, 3, 12, 2]
        sort(numbers)
        println(numbers)
        sort(numbers) { println($0, $1) ; return $0 > $1 }
        println(numbers)
        
        
        let left = LeftViewController()
        let center = CenterViewController()
        let right = RightViewController()
        let viewController = JASidePanelController()
        viewController.leftPanel = left;
        viewController.centerPanel = UINavigationController(rootViewController: center)
        viewController.rightPanel = right;
        self.window!.rootViewController = viewController;
        
//        JASidePanelController *viewController;
//        viewController = [[JASidePanelController alloc] init];
//        viewController.leftPanel = left;
//        viewController.centerPanel = [[UINavigationController alloc] initWithRootViewController:center];
//        viewController.rightPanel = right;
        
//        let manager = AFHTTPRequestOperationManager()
//        manager.GET(
//            "http://example.com/resources.json",
//            parameters: nil,
//            success: { (operation: AFHTTPRequestOperation!,
//                responseObject: AnyObject!) in
//                println("JSON: " + responseObject.description)
//            },
//            failure: { (operation: AFHTTPRequestOperation!,
//                error: NSError!) in
//                println("Error: " + error.localizedDescription)
//            })
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

