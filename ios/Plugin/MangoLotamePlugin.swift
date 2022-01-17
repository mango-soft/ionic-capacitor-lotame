import Foundation
import Capacitor
import LotameDMP

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

    /// Initialize Lotame.
    ///
    /// - clientId: Lotame Client ID.
    @objc func initialize(_ call: CAPPluginCall) {
        let clientId = call.getString("clientId") ?? ""
        print("Lotame Client ID: ", clientId)
        
        DMP.initialize(clientId)

        var resultData = ""
        DMP.sendBehaviorData() {
            result in
            if result.isSuccess{
                resultData = "Lotame Working from Mango Plugin"
                print(resultData)
                
                call.resolve([
                    "message": resultData
                ])
            } else {
                resultData = "Lotame Failure from Mango Plugin"
                print(resultData)
                
                call.resolve([
                    "message": resultData
                ])
            }
        }
    }
    
    @objc func getContacts(_ call: CAPPluginCall) {
        _ = call.getString("filter") ?? ""

//         DMP.initialize("16254")
//
//         DMP.addBehaviorData("value", forType: "type")
//         DMP.addBehaviorData(behaviorId: 1)
        
        call.resolve([
            "results": ["OK Working in iOS"]
        ])
    }
}
