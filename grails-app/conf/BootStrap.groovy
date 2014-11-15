import cwitter.User

class BootStrap {

    def init = { servletContext ->
        User u = new User()
        u.firstname = "AdminFirstName"
        u.lastname = "AdminLastName"
        u.username = "admin"
        u.password = "admin"
        u.email = "admin@admin.com"
        u.save(flush: true)
    }
    def destroy = {
    }
}
