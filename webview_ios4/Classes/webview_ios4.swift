import UIKit
import WebKit

public class Stamp {
    var stamp = "Stamp Testing"
    
    public init (){}
    
    public func buttonTapped(navigationController: UINavigationController?) {
        print("Stamp tap")
        let helloViewController = NextViewController()
//        print("Nav",navigationController)
        navigationController?.pushViewController(helloViewController, animated: true)
    }
}

class NextViewController: UIViewController,WKUIDelegate {
    
    var webView: WKWebView!
        
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 16.0, *) {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back ing", image: nil,target: self, action: #selector(onBackButton_Clicked(sender:)))
        } else {
            // Fallback on earlier versions
        }
        
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

    }
    
    // Back button events
    @objc func onBackButton_Clicked(sender: UIBarButtonItem)
    {
        print("Back tapping")
        if(webView.canGoBack) {
            print("Can go back")
            //Go back in webview history
            webView.goBack()
        } else {
            print("Can not go back")
            //Pop view controller to preview view controller
            self.navigationController?.popViewController(animated: true)
        }
    }

}
