
import Kitura
import LoggerAPI
import HeliumLogger


HeliumLogger.use(.info)
let router = Router()

router.get("/") {
    request, response, next in
    response.send("Welcome to million hairs!")
    next()
}

router.get("/staff") {
    request, response, next in
    response.send("Meet our great team")
    next()
}

router.get("/contact") {
    request, response, next in
    response.send("Get in touch with us")
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Log.info("Haters gonna hate anyway")
Kitura.run()


