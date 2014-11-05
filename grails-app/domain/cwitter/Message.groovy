package cwitter

class Message {

    String message
    static hasOne = [author : User]


    static constraints = {
        message size: 1..140, blank: false, nullable: false
    }
}
