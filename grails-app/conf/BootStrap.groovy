import cwitter.Cweet
import cwitter.Groupe
import cwitter.User

class BootStrap {

    java.util.Date dt = new java.util.Date();

    java.text.SimpleDateFormat sdf =
            new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    String currentTime = sdf.format(dt);

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
        User u3 = new User(firstname:"Imo", lastname: "Ben-CORDINA", username: "imo", password: "33", email: "imo@hh.com").save(flush: true)
        User u4 = new User(firstname:"Nico", lastname: "CORDINA", username: "nico", password: "44", email: "nico@hh.com").save(flush: true)

        Cweet c1  = new Cweet(message: "user 1 1st message").save(flush: true)
        Cweet c2  = new Cweet(message: "user 1 2nd message").save(flush: true)
        Cweet c3  = new Cweet(message: "user 1 3rd message").save(flush: true)
        Cweet c4  = new Cweet(message: "user2 1st message").save(flush: true)
        Cweet c5  = new Cweet(message: "user2 2nd message").save(flush: true)
        Cweet c6  = new Cweet(message: "user2 3rd message").save(flush: true)
        Cweet c7  = new Cweet(message: "user2 1st message").save(flush: true)
        Cweet c8  = new Cweet(message: "user2 2nd message").save(flush: true)
        Cweet c9  = new Cweet(message: "user2 3rd message").save(flush: true)
        Cweet c10 = new Cweet(message: "user2 1st message").save(flush: true)
        Cweet c11 = new Cweet(message: "user2 2nd message").save(flush: true)
        Cweet c12 = new Cweet(message: "user2 3rd message").save(flush: true)

        Groupe g1 = new Groupe(nom : "groupe1", owner : u1)
        Groupe g2 = new Groupe(nom : "groupe2", owner : u2)
        Groupe g3 = new Groupe(nom : "groupe3", owner : u3)

        g1.addToUsers(u4)
        g1.save(flush: true)

        g2.addToUsers(u3)
        g2.save(flush: true)

        g3.addToUsers(u1)
        g3.save(flush: true)

        u1.addToCweets(c1).save(flush: true)
        u1.addToCweets(c2).save(flush: true)
        u1.addToCweets(c3).save(flush: true)
        u2.addToCweets(c4).save(flush: true)
        u2.addToCweets(c5).save(flush: true)
        u2.addToCweets(c6).save(flush: true)
        u3.addToCweets(c7).save(flush: true)
        u3.addToCweets(c8).save(flush: true)
        u3.addToCweets(c9).save(flush: true)
        u4.addToCweets(c10).save(flush: true)
        u4.addToCweets(c11).save(flush: true)
        u4.addToCweets(c12).save(flush: true)
    }

    def destroy = {
    }
}
