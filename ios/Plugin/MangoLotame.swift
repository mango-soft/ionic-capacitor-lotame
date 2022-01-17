import Foundation

@objc public class MangoLotame: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
    
    @objc public func initialize(_ clientId: String) -> String {
        print(clientId)
        return clientId
    }
    
    @objc public func addBehavior(_ data: Any) -> Any {
        print(data)
        return data
    }
}
