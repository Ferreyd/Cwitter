package cwitter

class Cweet {

    String message
    Date date
    static belongsTo = [User]

    static constraints = {
        message size: 1..140, blank: false, nullable: false
    }
}
