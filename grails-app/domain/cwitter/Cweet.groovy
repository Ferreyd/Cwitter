package cwitter

class Cweet {

    String message
    Date date

    static belongsTo = [user : User]

    static constraints = {
        message size: 1..140, blank: false, nullable: false
        date blank: true, nullable: true
        user nullable: true
    }
}
