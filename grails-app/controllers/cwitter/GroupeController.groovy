package cwitter

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def getAllUser()
    {
        render User.list() as JSON
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model: [groupeInstanceCount: Groupe.count()]
    }

    def show(Groupe groupeInstance) {
        respond groupeInstance
    }

    def create() {
        respond new Groupe(params)
    }

    @Transactional
    def save(Groupe groupeInstance) {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view: 'create'
            return
        }
        //Le propriétaire du groupe est l'utilisateur courant
        groupeInstance.owner = session.user

        println groupeInstance.toString()


        groupeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: CREATED] }
        }
    }

    def edit(Groupe groupeInstance) {
        respond groupeInstance
    }

    @Transactional
    def follow(Groupe groupeInstance)
    {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view: 'edit'
            return
        }

        User user = User.findById(session.user.id)
        groupeInstance.addToUsers(user)
        user.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: OK] }
        }

    }

    def update(Groupe groupeInstance) {
        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view: 'edit'
            return
        }

        groupeInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Groupe groupeInstance) {

        if (groupeInstance == null) {
            notFound()
            return
        }

        groupeInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    @Transactional
    def searchByUsername()
    {

        println "######SEARCH = " + params.searchUsername + "  " + User.findByUsername(params.searchUsername)

            User userInstance = User.findByUsername(params.searchUsername)
            return userInstance

    }

    def searchWSUsername =
    {
        println "WS = " + params.searchUsername
        def users = User.findByUsername(params.searchUsername)
        render users as JSON

    }
}
