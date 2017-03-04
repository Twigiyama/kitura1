
import Kitura
import LoggerAPI
import HeliumLogger


HeliumLogger.use(.info)
let router = Router()

Kitura.addHTTPServer(onPort: 8090, with: router)
Log.info("Haters gonna hate anyway")
Kitura.run()


