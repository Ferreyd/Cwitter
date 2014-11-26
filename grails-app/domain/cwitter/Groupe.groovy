package cwitter

class Groupe {

    String nom

    static hasMany = [users : User]
    static belongsTo = [owner : User]
    static constraints = {
        users nullable: true
        owner nullable: true
    }
}
