
import Kitura
import LoggerAPI
import HeliumLogger


let router = Router()

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()


