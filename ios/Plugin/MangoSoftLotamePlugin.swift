import Foundation
import Capacitor
import LotameDMP

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(MangoSoftLotamePlugin)
public class MangoSoftLotamePlugin: CAPPlugin {
    private let implementation = MangoSoftLotame()

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
        print("Lotame plugin Client ID: ", clientId)
        
        DMP.initialize(clientId)

        var resultData = ""
        DMP.sendBehaviorData() {
            result in
            if result.isSuccess{
                resultData = "Lotame Working from Mango Plugin"
                print(resultData)
            } else {
                resultData = "Lotame Failure from Mango Plugin"
                print(resultData)
            }
            
            call.resolve([
                "message": resultData
            ])
        }
    }
    
    /// Add Behavior Data.
    ///
    /// - clientId: Lotame Client ID.
    @objc func addBehavior(_ call: CAPPluginCall) {
        let dataBehavior = call.getObject("data")
        print("Lotame plugin addBehavior data: ", dataBehavior as Any)
        
        if ((dataBehavior) != nil
            && ((dataBehavior?["value"]) != nil)
            && ((dataBehavior?["forType"]) != nil)) {
                
            DMP.addBehaviorData(dataBehavior?["value"] as? String,
                                forType: dataBehavior?["forType"] as! String)
            
            // DMP.addBehaviorData("value", forType: "type")
            // DMP.addBehaviorData(behaviorId: 1)
            
            var resultData = ""
            DMP.sendBehaviorData() {
                result in
                if result.isSuccess{
                    resultData = "Lotame Plugin added data"
                    print(resultData)
                } else {
                    resultData = "Lotame Plugin failure data"
                    print(resultData)
                }
                
                call.resolve([
                    "message": resultData,
                    "data": dataBehavior as Any
                ])
            }
        } else {
            call.resolve([
                "message": "Lotame Plugin error in the data to send"
            ])
        }
    }
}
