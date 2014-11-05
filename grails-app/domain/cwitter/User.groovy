package cwitter

class User {

    String username
    String lastname
    String firstname
    String password
    static hasMany = [follower : User , cweet: Message]


    static constraints = {
        username unique: true, nullable: false
        password nullable: false
        lastname nullable: true
        firstname nullable: true

    }
}
