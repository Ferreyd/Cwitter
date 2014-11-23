package cwitter

class User {

    String username
    String lastname
    String firstname
    String password
    String email
    static hasMany = [cweets: Cweet, groupes : Groupe]
    static mappedBy = [groupes: "owner"]


    static constraints = {
        username unique: true, nullable: false
        password nullable: false
        lastname nullable: true
        firstname nullable: true
        email nullable: true

    }
}
