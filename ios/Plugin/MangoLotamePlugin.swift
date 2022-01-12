import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(MangoLotamePlugin)
public class MangoLotamePlugin: CAPPlugin {
    private let implementation = MangoLotame()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func getContacts(_ call: CAPPluginCall) {
        let value = call.getString("filter") ?? ""
        
        call.resolve([
            "results": ["OK Working in iOS"]
        ])
    }
}
