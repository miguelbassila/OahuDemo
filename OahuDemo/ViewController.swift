import UIKit
import oahu
import WebKit

class ViewController: UIViewController, OahuDelegate {
    var oahu: Oahu?

    var interceptor: Interceptor?
    var contentType: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        oahu = Oahu(forView: view, allowsBackForwardNavigationGestures: true, interceptor: interceptor)
        oahu?.loadRequest("http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=2de143494c0b295cca9337e1e96b00e0")
//        oahu?.loadRequest("http://www.elo7.com.br")
        oahu?.oahuDelegate = self
    }


    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        if let contentType = self.contentType  {
            if contentType == "application/json; charset=utf-8" {
                let data = try! String(contentsOfURL: webView.URL!, encoding: NSUTF8StringEncoding)
                print(data)

                let dick = convertStringToDictionary(data)
                print(dick)
            }
        }
    }

    func convertStringToDictionary(text: String) -> [String: AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String:AnyObject]
            } catch {
                return nil
            }
        }
        return nil
    }

    func webView(webView: WKWebView, decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
        if let response = navigationResponse.response as? NSHTTPURLResponse {
            if let contentType = response.allHeaderFields["Content-Type"] as? String {
                self.contentType = contentType
            }
        }

        decisionHandler(.Allow)
    }
}



