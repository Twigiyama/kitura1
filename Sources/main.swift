
import KituraStencil
import Kitura
import LoggerAPI
import HeliumLogger


HeliumLogger.use(.info)
let router = Router()

router.setDefault(templateEngine: StencilTemplateEngine())
router.all("/static", middleware: StaticFileServer())

router.get("/") {
    request, response, next in
    defer { next()}
    try response.render("home", context: [:])
}


router.get("/staff") {
    request, response, next in
    defer { next() }
    response.send("Meet the staff")
}


router.get("/staff/:name") {
    request, response, next in
    defer { next() }
    let bios = [
            "kirk": "My name is James Kirk and I love snakes    ",
            "picard": "My name is Jean Luc Picard and I am into budgies",
            "sisko": "My name is Sisko and I am a Russki",
            "labrador": "I am the ship Labrador and I like Bones",
            "archer": "I am Archer and I like cookies",
            "janeway": "This is Janeway and I like hamsters"
    ]

    var context = [String: Any] ()
    context["people"] = bios.keys.sorted()

    guard let name = request.parameters["name"] else {

        return }

    if let bio = bios[name] {
        context["name"] = name
        context["bio"] = bio
    }
    try response.render("staff", context: context)
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Log.info("Haters gonna hate anyway")
Kitura.run()

//
