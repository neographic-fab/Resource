# Resource 

## NetworkF
### Usage

Add a `@StateObject` and inject `.environmentObject(networkManager)`

```SwiftUI
import SwiftUI
import NetworkManager

@main
struct CheckNetwork_EsApp: App {
    @StateObject private var networkManager = NetworkManager()    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkManager)
        }
    }
}
```
### Check Connection
use `isConnected` variable to check status 

```networkManager.isConnected ? Color.green : Color.red```


