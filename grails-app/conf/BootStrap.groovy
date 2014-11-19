import cwitter.Cweet
import cwitter.Groupe
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

        User u1 = new User(firstname:"Iman", lastname: "EL CHERIF", username: "ie", password: "11", email: "ie@hh.com").save(flush: true)

        User u2 = new User(firstname:"Nicolas", lastname: "CORDINA", username: "nc", password: "22", email: "nc@hh.com").save(flush: true)

        User u3 = new User(firstname:"Imo", lastname: "CORDINA", username: "imo", password: "33", email: "imo@hh.com").save(flush: true)

        User u4 = new User(firstname:"Nico", lastname: "CORDINA", username: "nico", password: "44", email: "nico@hh.com").save(flush: true)

        Cweet cweet1= new Cweet(message: "user 1 1st message ", date: 19/11/2014, user: u1).save(flush: true)
        Cweet cweet2= new Cweet(message: "user 1 2nd message ", date: 19/11/2014, user: u1).save(flush: true)
        Cweet cweet3= new Cweet(message: "user 1 3rd message ", date: 19/11/2014, user: u1).save(flush: true)

        Cweet cweet5= new Cweet(message: "user2 1st message", date: 19/11/2014, user: u2).save(flush: true)
        Cweet cweet6= new Cweet(message: "user2 2nd message", date: 19/11/2014, user: u2).save(flush: true)
        Cweet cweet7= new Cweet(message: "user2 3rd message", date: 19/11/2014, user: u2).save(flush: true)

        Cweet cweet8= new Cweet(message: "user2 1st message", date: 19/11/2014, user: u3).save(flush: true)
        Cweet cweet9= new Cweet(message: "user2 2nd message", date: 19/11/2014, user: u3).save(flush: true)
        Cweet cweet10= new Cweet(message: "user2 3rd message", date: 19/11/2014, user: u3).save(flush: true)

        Cweet cweet11= new Cweet(message: "user2 1st message", date: 19/11/2014, user: u4).save(flush: true)
        Cweet cweet12= new Cweet(message: "user2 2nd message", date: 19/11/2014, user: u4).save(flush: true)
        Cweet cweet13= new Cweet(message: "user2 3rd message", date: 19/11/2014, user: u4).save(flush: true)


    }

    def destroy = {
    }
}
