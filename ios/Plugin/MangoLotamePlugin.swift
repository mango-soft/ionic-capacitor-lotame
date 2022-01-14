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
    
    @objc func getContacts(_ call: CAPPluginCall) {
        let value = call.getString("filter") ?? ""

         DMP.initialize("16254")

         DMP.addBehaviorData("value", forType: "type")
         DMP.addBehaviorData(behaviorId: 1)

         DMP.sendBehaviorData(){
            result in
            if result.isSuccess{
                print("VCA Lotame Working from Mango Plugin")
            } else{
                print("VCA Lotame Failure from Mango Plugin")
                print(result)
            }
         }


        
        call.resolve([
            "results": ["OK Working in iOS"]
        ])
    }
}
