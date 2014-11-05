package cwitter

class Message {

    String message
    static belongsTo = [User]

    static constraints = {
        message size: 1..140, blank: false, nullable: false
    }
}
